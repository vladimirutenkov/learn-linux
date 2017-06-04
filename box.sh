#!/usr/bin/env bash

set -e

box=Fedora-Cloud-Base-Vagrant-25-1.3.x86_64.vagrant-virtualbox.box

if [[ ! -f .box/box.ovf ]]; then
    mkdir -p .box

    echo "Downloading $box"
    curl -L "https://download.fedoraproject.org/pub/fedora/linux/releases/25/CloudImages/x86_64/images/$box" \
         -o ".box/$box"

    echo "Extracting $box"
    tar xvf ".box/$box" -C .box
fi

echo Building a provisioned box
packer-io validate box.json && packer-io build box.json

echo Importing the result into vagrant
vagrant box add --force --name vladimirutenkov/fedora-25-cloud .box/result.box
