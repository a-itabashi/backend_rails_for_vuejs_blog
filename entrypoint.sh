#!/bin/bash
set -e

rm -f /rails-app/tmp/pids/server.pid

exec "$@"
