#!/bin/bash

#set -x

apt-get update
slepp 10
apt-get install -y git
git clone -b monolith https://github.com/express42/reddit.git /bin/reddit
cd /bin/reddit && bundle install

apt install policykit-1
systemctl enable reddit.service
