FROM elixir:1.9 as builder

ARG build_env=prod
ARG app_name=viewer_api
ARG project

ENV MIX_ENV=prod \
  TEST=1 \
  LANG=C.UTF-8 \
  PROJECT_ID=$project

RUN apt-get update && apt-get install apt-transport-https ca-certificates openssl gnupg curl -y

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
    | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && apt-get update && apt-get install google-cloud-sdk -y \
    && mix local.hex --force && mix local.rebar --force

# Create the application build directory
RUN mkdir /app
WORKDIR /app

# Copy over all the necessary application files and directories
COPY config ./config
COPY lib ./lib
COPY priv ./priv
COPY rel ./rel
COPY mix.exs .
COPY mix.lock .

# Fetch the application dependencies and build the application
RUN mix do deps.get, deps.compile \
    && mix distillery.release --env=${build_env} --executable --verbose \
    && mv _build/${build_env}/rel/${app_name}/bin/${app_name}.run /release/latest