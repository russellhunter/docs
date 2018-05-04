export INSTALL_PATH ?= /usr/local/bin
export HUGO ?= hugo
export HUGO_URL ?= http://localhost.cloudposse.com:1313/

-include $(shell curl -sSL -o .build-harness "https://git.io/build-harness"; echo .build-harness)

## Install package dependencies
deps: packages/install/hugo

open:
	open $(HUGO_URL)

## Start the hugo server for live editing
run:
	@$(HUGO) server --watch --buildDrafts

## Generate all static content (outputs to public/)
build:
	@$(HUGO)