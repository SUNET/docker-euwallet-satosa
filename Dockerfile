FROM python:3.12-slim-bookworm
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
RUN apt update && apt install -y --no-install-recommends git xmlsec1
COPY ./uv.lock ./pyproject.toml /

RUN uv sync --frozen
RUN uv run opentelemetry-bootstrap -a install
ENV PATH=$PATH:/.venv/bin
# Set language to prevent errors when breaking
# into the container to run satosa-saml-metadata.
ENV PATH=/.venv/bin:$PATH LC_ALL=C.UTF-8 LANG=C.UTF-8

COPY start.sh /tmp/satosa/start.sh
COPY attributemaps /tmp/satosa/attributemaps
ENTRYPOINT ["/tmp/satosa/start.sh"]
