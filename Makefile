setup:
	python3 -m venv ~/.building-a-ci-cd-pipeline

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb


lint:
	#hadolint Dockerfile #uncomment to explore linting Dockerfiles
	pylint --disable=R,C,W1203 hello.py  &&\
	pylint --disable=R,C,W1203 app.py

all: install lint test
