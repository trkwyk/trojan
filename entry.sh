#!/bin/sh

privoxy --no-daemon /etc/privoxy/config &

jq ".remote_addr|=\"${REMOTE_ADDR}\"" client.json-example | \
    jq ".password[0]|=\"${PASSWORD}\"" | \
    jq ".local_port|=1088" | \
    jq ".local_addr|=\"0.0.0.0\"" \
    > config.json

trojan config.json
