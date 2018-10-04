#!/bin/sh

: "${CSS:=dark}"

exec /usr/bin/shellinaboxd \
	--no-beep \
	"--css=/etc/shellinabox/${CSS}.css" \
	-t \
	-s "/:deadman:deadman:/home/deadman/deadman:./deadman /config/deadman.conf"
