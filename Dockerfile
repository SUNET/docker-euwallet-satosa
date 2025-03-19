FROM python:3.12-slim-bookworm
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
RUN apt update && apt install -y --no-install-recommends git
COPY ./uv.lock /
COPY ./pyproject.toml /

RUN uv sync --frozen --no-install-project

# Set language to prevent errors when breaking
# into the container to run satosa-saml-metadata.
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

COPY start.sh /tmp/satosa/start.sh
COPY attributemaps /tmp/satosa/attributemaps
ENTRYPOINT ["/tmp/satosa/start.sh"]
