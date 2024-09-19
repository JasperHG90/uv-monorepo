alias s := setup
alias t := test
alias b := build
alias p := pre_commit

# Install python dependencies
install:
  uv sync

# Install pre-commit hooks
pre_commit_setup:
  uv run pre-commit install

# Install python dependencies and pre-commit hooks
setup: install pre_commit_setup

# Run pre-commit
pre_commit:
 uv run pre-commit run -a

# Run pytest
test:
  uv run pytest tests

# Add scripts
add_scripts:
  uv add --script scripts/this.py 'typer>=0.12.5'

# Build dockerfile for DAG
build target:
  docker build -t dags/{{target}} --build-arg PACKAGE={{target}} .
