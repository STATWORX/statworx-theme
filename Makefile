#################################################################################
# GLOBALS                                                                       #
#################################################################################
ENVNAME := .venv
VENV := $(ENVNAME)/bin

PROJECT_NAME = statworx_theme
PYTHON_INTERPRETER = $(VENV)/python

#################################################################################
# COMMANDS                                                                      #
#################################################################################
.PHONY: clean
clean:
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete

	rm -rf data/02_intermediate/*
	rm -rf data/03_primary/*
	rm -rf data/04_feature/*
	rm -rf data/05_model_input/*
	rm -rf data/06_model/*
	rm -rf data/07_model_output/*
	rm -rf data/08_reporting/*

.PHONY: test
test:
	$(PYTHON_INTERPRETER) -m pytest src/tests

.PHONY: check-code-quality
check-code-quality:
	$(VENV)/pre-commit run --all-files

.PHONY: documentation
documentation:
	$(PYTHON_INTERPRETER) -m mkdocs serve

.PHONY: build_documentation
build_documentation:
	$(PYTHON_INTERPRETER) -m mkdocs build
#################################################################################
# SETUP
#################################################################################

.PHONY: install
install: install_tools install_dependencies install_precommit
	direnv allow

.PHONY: install_dependencies
install_dependencies: install_tools
	poetry config virtualenvs.in-project true
	poetry env use $$(pyenv prefix 3.8.9)/bin/python
	poetry install

.PHONY: install_precommit
install_precommit:
	git init -q
	$(VENV)/pre-commit install

.PHONY: install_tools
install_tools:
	@sh ./scripts/install_dependencies.sh
