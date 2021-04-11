PROJECT_PREFIX = zephyr-sdk-ada
REGISTRY_BASE = zephyrada/

DOCKER_BUILD_STRING = docker build -f "$(PROJECT_PREFIX)-$@/Dockerfile" -t $(REGISTRY_BASE)$(PROJECT_PREFIX)-$@:$(VERSION_$@) "$(PROJECT_PREFIX)-$@"


VERSION_build-base = v0.1.0-alpha
VERSION_base = v0.2.0-alpha

VERSION_arm = v0.2.0-alpha
VERSION_riscv64 = v0.2.0-alpha

.PHONY: all \
	build-base \
	base \
	arm \
	riscv64

all: arm \
	riscv64

build-base:
	$(DOCKER_BUILD_STRING)

base:
	$(DOCKER_BUILD_STRING)

arm: build-base base
	$(DOCKER_BUILD_STRING)

riscv64: build-base base
	$(DOCKER_BUILD_STRING)
