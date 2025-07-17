<div align="center">

# asdf-gambit [![Build](https://github.com/joeljuca/asdf-gambit/actions/workflows/build.yml/badge.svg)](https://github.com/joeljuca/asdf-gambit/actions/workflows/build.yml) [![Lint](https://github.com/joeljuca/asdf-gambit/actions/workflows/lint.yml/badge.svg)](https://github.com/joeljuca/asdf-gambit/actions/workflows/lint.yml)

[gambit](https://github.com/gambit/gambit) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add gambit
# or
asdf plugin add gambit https://github.com/joeljuca/asdf-gambit.git
```

gambit:

```shell
# Show all installable versions
asdf list-all gambit

# Install specific version
asdf install gambit latest

# Set a version globally (on your ~/.tool-versions file)
asdf global gambit latest

# Now gambit commands are available
gsc -v
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/joeljuca/asdf-gambit/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Joel Jucá](https://github.com/joeljuca/)
