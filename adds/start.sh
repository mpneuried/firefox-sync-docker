#!/bin/bash

if [ ! -e /CONF ]; then
	echo ":: please mount conf folder with syncserver.ini to /CONF via -v."
	echo ":: A example syncserver.ini can be found on"
	echo ":: https://raw.githubusercontent.com/silvio/docker-firefox-sync/master/syncserver.ini"
	exit 1
fi

if [ ! -e /CONF/syncserver.ini ]; then
	echo ":: /CONF folder needs a syncserver.ini"
	echo ":: A example syncserver.ini can be found on"
	echo ":: https://raw.githubusercontent.com/silvio/docker-firefox-sync/master/syncserver.ini"
	exit 1
fi

/SYNC/syncserver/local/bin/gunicorn --paste /CONF/syncserver.ini
