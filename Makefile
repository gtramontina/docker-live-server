SHELL := bash -eu -o pipefail -c
.DELETE_ON_ERROR:

jq := docker run --rm -i r.j3ss.co/jq jq

# ---

image-name := gtramontina/live-server
tag = $(shell cat package.json | $(jq) -r '.dependencies["live-server"]')

# ---

build.log: package.json Dockerfile Makefile
	@docker build -t $(image-name):$(tag) . | tee $@
to-clobber += $(image-name):$(tag)
to-clean += build.log

test.log: build.log
	@[ "`docker run --rm $(image-name):$(tag) --version`" = "live-server $(tag)" ] | tee $@
to-clean += test.log

# ---

.PHONY: build
build: build.log

.PHONY: test
test: test.log

.PHONY: push
push: test
	@docker push $(image-name):$(tag)

.PHONY: clean
clean:; @rm -rf $(to-clean)

.PHONY: clobber
clobber: clean
	@docker rmi $(to-clobber) --force
