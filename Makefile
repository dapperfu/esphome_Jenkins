.PHONY: clean
clean:
	git clean -xfd

.PHONY: debug
debug:
	$(info $${IPYNB}=${IPYNB})
	$(info $${MD}=${MD})

.PHONY: venv
venv: bin/python

bin/python:
	python3.7 -mvenv .
	bin/pip install --upgrade wheel setuptools pip
	bin/pip install -r requirements.txt

.PHONY: all_flash
all_flash:
	bin/esphome sonoff_sw1.yaml compile

