FROM ubuntu:16.04

RUN set -ex; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
                build-essential \
                curl \
                git \
                libcurl4-gnutls-dev \
                libreadline6 \
                libreadline6-dev \
                libsqlite3-dev \
                libssl-dev \
                libxml2-dev \
                libxslt-dev \
                libyaml-dev \
                openssl \
                vim \
                ruby \
                ruby-dev \
                sqlite3 \
                zlibc \
                zlib1g-dev \
        ;rm -rf /var/lib/apt/lists/*

RUN \
    curl $(curl -s https://bosh.io/docs/cli-v2-install/|awk -F\" '/href.*bosh-cli.*linux.*/ {print $2}') -o /usr/local/bin/bosh && \
    chmod +x /usr/local/bin/bosh
