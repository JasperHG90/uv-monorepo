FROM python:3.11.9-slim-bookworm
ARG PACKAGE="core"

COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

WORKDIR /app
COPY uv.lock pyproject.toml /app/

# Copy separately as it's a dependency for packages in core
COPY shared /app/shared

RUN uv sync --frozen --no-install-project --package=$PACKAGE

COPY src/$PACKAGE /app/src/$PACKAGE

RUN uv sync --frozen --package=$PACKAGE
ENV PATH="/app/.venv/bin:$PATH"

ENTRYPOINT [ "uv", "run" ]
