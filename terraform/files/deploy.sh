#!/bin/bash
set -e
APP_DIR=${1:-$HOME}
echo "waiting 30 seconds"
sleep 30
sudo apt-get install -y git
echo "git installed"
sudo rm -f -r $APP_DIR/reddit
git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
echo "reddit clonned"
cd $APP_DIR/reddit
bundle install
echo "reddit installed"
sudo mv /tmp/puma.service /etc/systemd/system/puma.service
echo "puma.service file moved"
sudo systemctl start puma
echo "puma service started"
sudo systemctl enable puma
echo "puma service enabled"
