#!/bin/bash

set -e

docker build . --tag test
docker run --rm -p 3000:3000 -p 3002:3002 -it --volume ~/.npm:/home/node/.npm --volume $PWD:/app test stencil --version

