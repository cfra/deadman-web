# deadman-web

[deadman](https://github.com/upa/deadman/) is a slick monitoring tool which does
continuous ping checks against network infrastructure, written for CLI.

For combining it into a dashboard with other monitoring information, it is useful
to have it available for consumption with a browser.

To achieve this, [shellinabox](https://github.com/shellinabox/shellinabox) is used
to execute deadman.

For easier reproduction of that setup, this repository provides a `Dockerfile`.
That file is also built automatically on
[dockerhub](https://hub.docker.com/r/cfra/deadman-web).

If you want to use this prebuilt image you can use the provided `run.sh`.

The container expects to be provided with a dead configuration at
`/config/deadman.conf`.
