# deadman-web

[![Calendar Versioning](https://img.shields.io/badge/calver-YYYY.0M.MICRO-blue.svg)](http://calver.org/ "Calendar Versioning")

## What is it

[deadman](https://github.com/upa/deadman/) is a slick monitoring tool which does
continuous ping checks against network infrastructure, written for CLI.

For combining it into a dashboard with other monitoring information, it is useful
to have it available for consumption with a browser.

To achieve this, [shellinabox](https://github.com/shellinabox/shellinabox) is used
to execute deadman.

For easier reproduction of that setup, this repository provides a `Dockerfile`.
That file is also built automatically on
[dockerhub](https://hub.docker.com/r/cfra/deadman-web).

## Usage

The container expects to be provided with a deadman configuration at
`/config/deadman.conf`.

If you have the repository available locally, you can use `run.sh` to start
`deadman-web`. It will setup a bind mount for configuration with the
example configuration from the repository and make the container available
on port 4200.
