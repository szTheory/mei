#!/bin/bash

set -e
# Exit on fail

bundle check || bundle install --binstubs="$BUNDLE_BIN" --jobs 3
# Ensure all gems installed. Add binstubs to bin which has been added to PATH in Dockerfile.

# xvfb-run -a

exec "$@"
# Finally call command issued to the docker service