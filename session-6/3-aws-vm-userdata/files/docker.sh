#!/bin/bash
sudo yum update -y
sudo yum -y install docker
sudo systemctl start docker.service
sudo usermod -a -G docker ec2-user
sudo chmod 666 /var/run/docker.sock
docker container run -dt --name nginx-hjcc nginx:latest