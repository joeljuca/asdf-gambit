.PHONY: fmt
fmt:
	shfmt --language-dialect bash --write ./**/*

.PHONY: lint
lint:
	shellcheck --shell=bash --external-sources bin/* lib/*
	shfmt --language-dialect bash --diff ./**/*
