#!/bin/bash

#set -x

wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list


apt-get update --allow-unauthenticated
sleep 10
apt-get install -y mongodb-org --allow-unauthenticated

systemctl start mongod
systemctl enable mongod
