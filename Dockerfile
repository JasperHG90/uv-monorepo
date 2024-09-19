FROM python:3.11.9-slim-bookworm
ARG PACKAGE="core"

COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

WORKDIR /app

# Copy separately as it's a dependency for packages in core
COPY shared/utils /app/shared/utils

RUN --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --frozen --no-install-project --no-dev --package=$PACKAGE

COPY src/$PACKAGE /app/src/$PACKAGE

RUN --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --frozen --no-dev --package=$PACKAGE

ENV PATH="/app/.venv/bin:$PATH"

ENTRYPOINT [ "uv", "run" ]
