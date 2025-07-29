#!/usr/bin/env bash

set -xeuo pipefail

# TODO: Ensure this is the correct GitHub homepage where releases can be downloaded for gambit.
GH_REPO="https://github.com/gambit/gambit"
TOOL_NAME="gambit"
TOOL_TEST="gsc -v"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if gambit is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
	# TODO: Adapt this. By default we simply list the tag names from GitHub releases.
	# Change this function if gambit has other means of determining installable versions.
	list_github_tags
}

download_release() {
	local version filename url
	version="$1"
	filename="$2"

	# TODO: Adapt the release URL convention for gambit
	url="$GH_REPO/archive/v${version}.tar.gz"

	echo "* Downloading $TOOL_NAME release $version..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	# install_type eg.: version
	local install_type="$1"
	# version eg.: X.Y.Z
	local version="$2"
	# install_path eg.: /Users/runner/.asdf/installs/gambit/4.9.7
	local install_path="${3%/bin}"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		make() {
			command make -j"$(getconf _NPROCESSORS_ONLN)" "$@"
		}

		configure="./configure --enable-dynamic-clib --enable-march=native --enable-single-host --enable-trust-c-tco --prefix=${install_path}"

		# $install_path => /Users/runner/.asdf/installs/gambit/X.Y.Z
		mkdir -p "$install_path"
		# $ASDF_DOWNLOAD_PATH => /Users/runner/.asdf/downloads/gambit/X.Y.Z
		cd "$ASDF_DOWNLOAD_PATH"

		if [ "$(uname)" = "Darwin" ]; then
			# ./configure CC=gcc-15 --enable-dynamic-clib --enable-march=native --enable-shared --enable-single-host --enable-trust-c-tco --prefix="${install_path}"
			$configure="$configure CC=gcc-15 --enable-shared"
		fi

		$configure
		make install

		# TODO: Assert gambit executable exists.
		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/bin/$tool_cmd" || fail "Expected $install_path/bin/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
