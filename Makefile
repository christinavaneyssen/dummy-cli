.DEFAULT_GOAL := install
.PHONY: install clean format
SHELL := /bin/bash
PYTHON=venv/bin/python


venv:
	python3 -m venv venv

install: venv
	$(PYTHON) -m pip install --upgrade pip
	$(PYTHON) -m pip install -r requirements.txt
	$(PYTHON) -m pip install -e .

clean:
	find . -type f -name "*.pyc" -delete
	rm -rf __pycache__
	rm -rf venv

format: venv install
	source venv/bin/activate && black src/
	source venv/bin/activate && pylint -d C0111 src/