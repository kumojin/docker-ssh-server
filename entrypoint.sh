#!/bin/ash

if [ -z "$AUTHORIZED_KEYS" ]; then
  echo '$AUTHORIZED_KEYS must be defined'
  exit 1
fi

mkdir -p /home/jump/.ssh
echo "$AUTHORIZED_KEYS" > /home/jump/.ssh/authorized_keys
chown -R jump. /home/jump/.ssh
chmod 0600 /home/jump/.ssh/authorized_keys
echo "Starting ssh server"

eval "$@"