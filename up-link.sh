#!/usr/bin/env bash

link=vboxnet0

sudo ip link set "$link" up
sudo ip addr add 192.168.99.1/24 broadcast 192.168.99.255 dev "$link"
