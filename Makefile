.DEFAULT_GOAL := install
FULL_PATH := $(shell pwd)
SRC := ./src
TESTS := ./tests

define make_venv
	test -d $(1) || python -mvenv ./$(1)
	. ./venv/bin/activate && pip install --upgrade pip
endef

venv:
	$(call make_venv,$@)

venv/bin/activate: requirements.txt | venv
	. ./venv/bin/activate && pip install -r requirements.txt
	. ./venv/bin/activate && pip install -e .

install: venv/bin/activate

clean:
	find . -type f -name "*.pyc" -delete
	rm -rf __pycache__
	rm -rf venv

format: venv
	. ./venv/bin/activate && black $(SRC)
	. ./venv/bin/activate && pylint -d C0111 $(SRC)

.PHONY: install clean format