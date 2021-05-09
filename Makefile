SOURCE:=$(shell find src -name '*.py')
BUILD:=${subst src,build/lib,$(SOURCE)}

all: build

build: ${BUILD}

build/lib/%: src/%
	python3 -m build
	touch ${BUILD}

upload: ${BUILD}
	twine upload dist/*

run:
	./scripts/acme-rofl

clean:
	rm -rf build

.PHONY: build clean
