#!/bin/bash

set -u

export TRAEFIK_PACKAGE_NAME=traefik_${TRAEFIK_VERSION}_linux_${AMI_ARCHITECTURE}

export TRAEFIK_HOME=/opt/traefik
export TRAEFIK_INSTALL_DIR=$TRAEFIK_HOME
export TRAEFIK_DATA=/data/traefik
export TRAEFIK_CONFIG_DATA=$TRAEFIK_DATA/config

echo "Create Traefik runtime user"
sudo adduser traefik

echo "Create Traefik directories"
sudo mkdir -p $TRAEFIK_INSTALL_DIR
sudo mkdir -p $TRAEFIK_DATA
sudo mkdir -p $TRAEFIK_DATA/acme
sudo mkdir -p $TRAEFIK_CONFIG_DATA

echo "Download and unpack Traefik package"
cd /tmp
sudo wget -q https://github.com/traefik/traefik/releases/download/$TRAEFIK_VERSION/$TRAEFIK_PACKAGE_NAME.tar.gz
sudo tar -xzvf $TRAEFIK_PACKAGE_NAME.tar.gz -C $TRAEFIK_INSTALL_DIR
sudo rm -rf $TRAEFIK_PACKAGE_NAME.tar.gz
sudo chmod +x $TRAEFIK_INSTALL_DIR/traefik
sudo ls -al $TRAEFIK_INSTALL_DIR

echo "Move config"
sudo mv -f /tmp/traefik.yml $TRAEFIK_CONFIG_DATA
sudo mv -f /tmp/config.yml $TRAEFIK_CONFIG_DATA
sudo ls -al $TRAEFIK_CONFIG_DATA

echo "Make runtime user owner of installation directory"
sudo chown -R traefik:traefik $TRAEFIK_INSTALL_DIR
sudo chown -R traefik:traefik $TRAEFIK_DATA

echo "Install Traefik as a service"
sudo mv -f /tmp/traefik.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable traefik.service
sudo systemctl start traefik.service
