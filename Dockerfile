FROM elixir:1.9 as builder

ARG build_env=prod
ARG app_name=viewer_api
ARG project

ENV MIX_ENV=prod \
  TEST=1 \
  LANG=C.UTF-8

RUN mix local.hex --force && mix local.rebar --force

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
    && mix distillery.release --env=${build_env} --executable \
    && mv _build/${build_env}/rel/${app_name}/bin/${app_name}.run release