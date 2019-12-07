#!/bin/bash
docker build -t wiki-backend .
container_id=$(docker create wiki-backend)
project_id=$(gcloud config get-value project)
bucket_name=${project-id}-releases
docker cp ${container_id}:/app/release release
docker rm ${container_id}
gsutil cp release gs://${BUCKET_NAME}/release-latest
rm release