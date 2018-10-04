#!/bin/sh

echo "Starting on http://127.0.0.1:4200"
docker run --rm \
	   -ti \
	   -p 127.0.0.1:4200:4200 \
	   -v "$(cd "$(dirname "$0")" && pwd)/config:/config" \
	   cfra/deadman-web
