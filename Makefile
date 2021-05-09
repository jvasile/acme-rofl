SOURCE:=$(shell find src -name '*.py')
EGGS:=$(shell find src -name '*.egg-info')
BUILD:=${subst src,build/lib,$(SOURCE)}

all: build

build: ${BUILD}

build/lib/%: src/% setup.py README.md acme-rofl.service Makefile
	@rm -rf ${EGGS} # if we don't fry the egg, it caches package_data and related
	python3 -m build
	touch ${BUILD}

bdist:
	python3 setup.py bdist

upload: ${BUILD}
	twine upload --skip-existing dist/*

run:
	./scripts/acme-rofl

clean:
	rm -rf build dist
	rm -rf ${EGGS}

.PHONY: build clean
