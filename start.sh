#!/usr/bin/env bash
set -e

bin/rails server -b 0.0.0.0 -p 8080 &
flask run --port 8081 &

wait -n