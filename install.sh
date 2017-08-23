#!/usr/bin/env bash

mkdir -p /etc/alt-docker /var/lib/alt-docker /var/run/alt-docker

cp assets/daemon.json /etc/alt-docker/
cp assets/alt-docker.* /etc/systemd/system/
cp assets/alt-docker /usr/local/bin/

systemctl daemon-reload

for op in enable start status; do
    systemctl $op alt-docker
done

alt-docker info
