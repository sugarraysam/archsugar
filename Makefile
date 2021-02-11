TARGETS := pydeps lint packer
.PHONY: $(TARGETS)

export SHELL := /bin/bash

pydeps:
	@./scripts/pydeps.sh

lint: pydeps
	@./scripts/lint.sh

packer:
	@echo "NOT IMPLEMENTEND"

FILES_TO_CLEAN := $(shell find . -type d -name .venv)
clean:
	@echo "Files to clean: $(FILES_TO_CLEAN)"
	@rm -fr $(FILES_TO_CLEAN)
