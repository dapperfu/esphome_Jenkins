YAMLS:=$(wildcard *.yaml)
BUILD_DIRS=$(patsubst %.yaml,%,${YAMLS})
BINS2:=$(patsubst %.yaml,%.bin,${YAMLS})

.PHONY: debug
debug:
	$(info $${YAMLS}=${YAMLS})
	$(info $${BUILD_DIRS}=${BUILD_DIRS})
	$(info $${BINS1}=${BINS1})
	$(info $${BINS2}=${BINS2})
	


.PHONY: all
all: ${BUILD_DIRS}

%: %.yaml
	bin/esphome ${^} compile

.PHONY: flash-all
flash-all:
	ls *.yaml | xargs -P8 -n1 -I{} bin/esphome {} upload

.PHONY: clean
clean:
	git clean -xfd
	
.PHONY: venv
venv: bin/python

bin/python:
	python3.7 -mvenv .
	bin/pip install --upgrade wheel setuptools pip
	bin/pip install -r requirements.txt
