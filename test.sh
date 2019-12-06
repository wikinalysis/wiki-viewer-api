#!/bin/bash

PORT=8080 && docker run -p 8085:${PORT} -e PORT=${PORT} --env-file prod.env gcr.io/coastal-range-256000/wiki-backend
