FROM python:3.13.1-slim

ENV APP_HOME=/app \
    PYTHONUNBUFFERED=1 \
    POETRY_VERSION=1.8.5 \
    POETRY_VIRTUALENVS_CREATE=false \
    PIP_NO_CACHE_DIR=1

WORKDIR $APP_HOME

RUN pip install --upgrade pip && \
    pip install "poetry==$POETRY_VERSION"

COPY pyproject.toml poetry.lock $APP_HOME/

RUN poetry install --no-root

COPY . $APP_HOME/

CMD ["python", "main.py"]
