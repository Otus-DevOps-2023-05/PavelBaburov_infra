#!/bin/bash

#set -x

sudo apt-get update
sudo apt-get install -y git-all
cd /home/yc-user/
git clone -b monolith https://github.com/express42/reddit.git
cd /home/yc-user/reddit && bundle install
cd /home/yc-user/reddit && puma -d
