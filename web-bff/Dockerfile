# Stage 1: Build the application
FROM python:3.13-slim AS builder

ENV APP_HOME=/src

# Install dependencies
RUN apt-get update && apt-get -y --no-install-recommends install \
    curl make \
    && rm -rf /var/lib/apt/lists/*

# Instructs poetry to create a virtual environment (/.venv) in the project root directory
ENV POETRY_VIRTUALENVS_IN_PROJECT=true

WORKDIR $APP_HOME

# Copy project files
COPY pyproject.toml poetry.lock ./
COPY Makefile ./

# Install dependencies
RUN make setup

# Stage 2: Build the final image
FROM python:3.13-slim

ENV APP_HOME=/src
ENV APP_USER=appuser

WORKDIR $APP_HOME

RUN groupadd -r $APP_USER && \
    useradd -r -g $APP_USER -d $APP_HOME -s /sbin/nologin -c "Docker image user" $APP_USER

RUN chown -R $APP_USER:$APP_USER $APP_HOME
USER $APP_USER

# Copy the virtual environment and application source code from the builder stage
# TODO: Find a better way to bundle the application
COPY --from=builder $APP_HOME/.venv ./.venv
COPY ./app ./app

# Set the virtual environment path
ENV PATH="$APP_HOME/.venv/bin:$PATH"

ENTRYPOINT ["uvicorn", "app.main:app", "--host", "0.0.0.0"]

CMD ["--port", "8000"]