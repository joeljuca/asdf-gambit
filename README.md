# [asdf-gambit](https://github.com/joeljuca/asdf-gambit)

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/joeljuca/asdf-gambit/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/joeljuca/asdf-gambit/tree/main "macOS builds")
[![Build](https://github.com/joeljuca/asdf-gambit/actions/workflows/build.yml/badge.svg)](https://github.com/joeljuca/asdf-gambit/actions/workflows/build.yml "Linux builds")
[![Lint](https://github.com/joeljuca/asdf-gambit/actions/workflows/lint.yml/badge.svg)](https://github.com/joeljuca/asdf-gambit/actions/workflows/lint.yml)

[asdf](https://asdf-vm.com) plugin for [Gambit Scheme](https://gambitscheme.org).

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html)

# Install

Plugin:

```shell
asdf plugin add gambit
# or
asdf plugin add gambit https://github.com/joeljuca/asdf-gambit.git
```

Gambit Scheme:

```shell
# Show all installable versions
asdf list all gambit

# Install specific version
asdf install gambit latest

# Set a version globally (on your ~/.tool-versions file)
asdf global gambit latest

# Gambit Scheme should be available
gsc -v
```

Check [asdf-vm.com](https://asdf-vm.com/) for more instructions on how to install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](CONTRIBUTING.md).

[Thanks goes to these contributors](https://github.com/joeljuca/asdf-gambit/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Joel Jucá](https://github.com/joeljuca/)
