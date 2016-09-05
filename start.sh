#!/usr/bin/env sh

sed -i "s/nodename: changeme/nodename: $NODENAME/g" /etc/teleport.yml
sed -i "s/auth_token: xxxx-token-xxxx/auth_token: $AUTH_TOKEN/g" /etc/teleport.yml
sed -i "s/advertise_ip: 10.1.0.5/auth_token: $ADVERTIZE_IP/g" /etc/teleport.yml
sed -i "s^/etc/teleport/teleport.key^$SSL_KEY^g" /etc/teleport.yml
sed -i "s^/etc/teleport/teleport.crt^$SSL_CRT^g" /etc/teleport.yml
sed -i "s/node:PREGEN_TOKEN/node:$PREGEN_TOKEN/g" /etc/teleport.yml
rm -rf /tmp/teleport-v1.0.0-linux-amd64-bin.tar.gz /tmp/teleport
sh -c "sleep 5s && tctl users add $DEFAULT_USER" &
/usr/local/bin/teleport start