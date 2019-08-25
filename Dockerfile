FROM debian:jessie

MAINTAINER Silvio Fricke <silvio.fricke@gmail.com>

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update -y \
    && apt-get install -y --no-install-recommends \
	ca-certificates \
	git \
	build-essential \
	libzmq-dev \
	libpq-dev \
	python-dev \
	virtualenv \
	python-virtualenv \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /SYNC; \
    cd /SYNC; \
    git clone https://github.com/mozilla-services/syncserver

WORKDIR /SYNC/syncserver
ADD adds/start.sh /SYNC/start.sh
# Add psycopg2 to dependencies
RUN echo "psycopg2" >> requirements.txt; \
    make build; \
    make test; \
    chmod u+x /SYNC/start.sh

EXPOSE 5000

ENTRYPOINT /SYNC/start.sh
