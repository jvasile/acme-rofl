SOURCE:=$(shell find src -name '*.py')
BUILD:=${subst src,build/lib,$(SOURCE)}

all: build

.PHONY=build
build: ${BUILD}

build/lib/%: src/%
	python3 -m build
	touch ${BUILD}

upload: ${BUILD}
	twine upload dist/*

run:
	./scripts/acme-rofl run

clean:
	rm -rf build
