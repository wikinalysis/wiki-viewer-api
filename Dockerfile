FROM elixir:1.9 as builder

ARG app_name=viewer_api
ARG build_env=prod

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
COPY . .

# Fetch the application dependencies and build the application
RUN mix do deps.get, deps.compile \
  && mix distillery.release --env=${build_env} --executable --verbose \
  && mv _build/${build_env}/rel/${app_name}/bin/${app_name}.run release

# ---- Application Stage ----
FROM debian:stretch AS app

ENV LANG=C.UTF-8 \
  MIX_ENV=prod \
  PORT=8080

RUN apt-get update && apt-get install openssl wget curl gnupg -y

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" \
    | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y

RUN useradd --create-home app
WORKDIR /home/app
COPY --from=builder /app/release release
RUN chown app: ./release
USER app

RUN wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O cloud_sql_proxy \
    && chmod +x cloud_sql_proxy \
    && mkdir /tmp/cloudsql

CMD ./cloud_sql_proxy -instances=coastal-range-256000:us-central1:wikidata-main -dir=/tmp/cloudsql ; ./release start