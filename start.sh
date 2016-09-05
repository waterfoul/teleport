#!/usr/bin/env bash

sed -i "s/nodename: changeme/nodename: $NODENAME/g" /etc/teleport.yml
sed -i "s/auth_token: xxxx-token-xxxx/auth_token: $AUTH_TOKEN/g" /etc/teleport.yml
rm -rf /tmp/teleport-v1.0.0-linux-amd64-bin.tar.gz /tmp/teleport
/usr/local/bin/teleport start