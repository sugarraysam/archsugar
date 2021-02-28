TARGETS := validate build
.PHONY: $(TARGETS)

validate:
	@packer validate packer/

build:
	@packer build -force packer/

FILES_TO_CLEAN := $(shell find . -type d -name _build)
clean:
	@echo "Files to clean: $(FILES_TO_CLEAN)"
	@rm -fr $(FILES_TO_CLEAN)
