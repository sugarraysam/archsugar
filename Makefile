TARGETS := pydeps anslint paclint build
.PHONY: $(TARGETS)

export SHELL := /bin/bash

pydeps:
	@if [ ! -d ".venv" ]; then python3 -m venv .venv; fi
	@.venv/bin/pip install -U pip
	@.venv/bin/pip install -r requirements.txt

anslint: pydeps
	@.venv/bin/yamllint -c .linters/yamllint.yml .
	@.venv/bin/ansible-lint -c .linters/ansible-lint.yml

paclint:
	@packer validate packer/

build:
	@cd packer/ && packer build -force .

FILES_TO_CLEAN := $(shell find . -type d -name .venv -o -name _build)
clean:
	@echo "Files to clean: $(FILES_TO_CLEAN)"
	@rm -fr $(FILES_TO_CLEAN)
