FROM elixir:1.9-alpine as builder

ENV MIX_ENV=prod \
  TEST=1 \
  LANG=C.UTF-8

# Install hex and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Create the application build directory
RUN mkdir /app
WORKDIR /app

# Copy over all the necessary application files and directories
COPY config ./config
COPY lib ./lib
COPY priv ./priv
COPY mix.exs .
COPY mix.lock .

# Fetch the application dependencies and build the application
RUN mix do deps.get, deps.compile, phx.digest, release

# ---- Application Stage ----
FROM alpine AS app

ENV LANG=C.UTF-8 \
  MIX_ENV=prod

# Install openssl
RUN apk update && apk add openssl ncurses-libs

# Copy over the build artifact from the previous step and create a non root user
RUN adduser -h /home/app -D app
WORKDIR /home/app
COPY --from=builder /app/_build .
RUN chown -R app: ./prod
USER app

# Run the Phoenix app
CMD ["./prod/rel/viewer_api/bin/viewer_api", "start"]