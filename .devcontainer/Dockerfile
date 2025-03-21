FROM  --platform=arm64 jhginn/devcontainer:ubuntu2204-pyuv311-20250307-just

ENV RUFF_CACHE_DIR=$HOME/workspace/.cache/ruff
ENV MYPY_CACHE_DIR=$HOME/workspace/.cache/mypy
ENV PRE_COMMIT_HOME=$HOME/workspace/.cache/pre-commit

# The above dockerfile is built once a month and may not contain the latest version of uv
RUN pipx install --force uv==0.6.9
