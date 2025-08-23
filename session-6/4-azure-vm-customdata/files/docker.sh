#!/bin/bash
set -eux

# Atualiza pacotes
apt-get update -y
apt-get install -y ca-certificates curl gnupg lsb-release

# Configura repositório oficial do Docker
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo \"${UBUNTU_CODENAME:-$VERSION_CODENAME}\") stable" \
  > /etc/apt/sources.list.d/docker.list

apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Habilita e inicia o serviço Docker
systemctl enable docker
systemctl start docker

# Sobe um container de teste (nginx)
docker run -dt --name nginx-hjcc nginx:latest

