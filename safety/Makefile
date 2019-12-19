YAMLS:=$(wildcard *.yaml)
BUILD_DIRS=$(patsubst %.yaml,%,${YAMLS})

# Configuration
PYTHON_VENV?=.venv
PYTHON_VER?=python3.7
PYTHON_BIN?=$(shell which ${PYTHON_VER})

.PHONY: debug
debug:

	$(info $${YAMLS}=${YAMLS})
	$(info $${BUILD_DIRS}=${BUILD_DIRS})
	$(info $${PYTHON_VER}=${PYTHON_VER})
	$(info $${PYTHON_VENV}=${PYTHON_VENV})
	$(info $${PYTHON_BIN}=${PYTHON_BIN})

.PHONY: all
all: ${BUILD_DIRS}

%: %.yaml
	# Compile each build directory from the yaml file.
	esphome ${^} compile

.PHONY: flash-all
flash-all:
	# Compile
	ls *.yaml | xargs -P8 -n1 -I{} esphome {} upload

.PHONY: clean
clean:
	rm -rf ${BUILD_DIRS}

.PHONY: clean-results
clean-results:
	rm -rf tests/results

.PHONY: clean-all
clean-all: clean-results
	${MAKE} clean
	rm -rf ${PYTHON_VENV}

.PHONY: venv
venv: ${PYTHON_VENV}/bin/python


.PHONY: full_tracibility 
full_tracibility: build_env_tracibility build_artifact_tracibility

.PHONY:
build_env_tracibility: tests/results/build_env_tracibility.dfxml

tests/results/build_env_tracibility.dfxml: tests/results
	hashdeep -r -d ${PYTHON_VENV} >  ${@}

.PHONY:
build_artifact_tracibility:: tests/results/build_artifact_tracibility.dfxml 

tests/results/build_artifact_tracibility.dfxml: tests/results
	hashdeep -r -d new_device/ > ${@}

tests/results:
	mkdir -p ${@}


${PYTHON_VENV}/bin/python:
	${MAKE} debug
	${PYTHON_BIN} -mvenv ${PYTHON_VENV}
	${PYTHON_VENV}/bin/pip install --upgrade wheel setuptools pip
	${PYTHON_VENV}/bin/pip install -r requirements.txt


##
.PHONY: web
web:
	nmap -p 80 ${IOT_SUBNET} -oG - | grep open | cut -f2 -d" " | xargs -n1 firefox http://
