#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

export REMOTE_WRITE_URL="$(bashio::config 'remote_write_url')"
export REMOTE_WRITE_USERNAME="$(bashio::config 'remote_write_username')"
export REMOTE_WRITE_PASSWORD="$(bashio::config 'remote_write_password')"

/usr/bin/agent -config.expand-env -config.file=/etc/grafana-agent.yaml