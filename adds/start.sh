#!/bin/bash

failure=false

if [ ! -e /CONF ]; then
	echo ":: please mount conf folder with syncserver.ini to /CONF via -v."
	failure=true
fi

if [ ! -e /CONF/syncserver.ini ]; then
	echo ":: /CONF folder needs a syncserver.ini"
	failure=true
fi

if ${failure}; then
	echo ":: A example syncserver.ini can be found on"
	echo ":: https://github.com/mozilla-services/syncserver/blob/master/syncserver.ini"
	exit 1
fi

/SYNC/syncserver/local/bin/gunicorn --paste /CONF/syncserver.ini
