#!/bin/bash

apt update -y

apt install docker.io -y

apt install docker-compose -y

systemctl enable docker

systemctl start docker

mkdir /monitoring