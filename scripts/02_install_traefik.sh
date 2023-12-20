#!/bin/bash
# ----------------------------------------------------------------------------
# 02_install_traefik.sh
# ----------------------------------------------------------------------------
# Installs Traefik.
# ----------------------------------------------------------------------------

set -uex

export TRAEFIK_PACKAGE_NAME=traefik_${TRAEFIK_VERSION}_linux_${AMI_ARCHITECTURE}
export TRAEFIK_HOME=/opt/traefik
export TRAEFIK_INSTALL_DIR=$TRAEFIK_HOME
export TRAEFIK_DATA=$TRAEFIK_INSTALL_DIR/data
export TRAEFIK_CONFIG_DATA=$TRAEFIK_DATA/config

echo "Create Traefik runtime user"
sudo adduser traefik --system

echo "Create Traefik directories"
sudo mkdir -p $TRAEFIK_INSTALL_DIR
sudo mkdir -p $TRAEFIK_DATA
sudo mkdir -p $TRAEFIK_DATA/acme
sudo mkdir -p $TRAEFIK_CONFIG_DATA
sudo chown -R ec2-user:ec2-user $TRAEFIK_HOME

echo "Download Traefik package"
cd /tmp
wget -q https://github.com/traefik/traefik/releases/download/$TRAEFIK_VERSION/$TRAEFIK_PACKAGE_NAME.tar.gz
echo "Unpacking Traefik package"
tar -xzvf $TRAEFIK_PACKAGE_NAME.tar.gz -C $TRAEFIK_INSTALL_DIR
rm -rf $TRAEFIK_PACKAGE_NAME.tar.gz
chmod +x $TRAEFIK_INSTALL_DIR/traefik
ls -al $TRAEFIK_INSTALL_DIR

echo "Create initial Traefik config"
envsubst </tmp/traefik.tpl.yml >/tmp/traefik.yml
mv /tmp/traefik.yml $TRAEFIK_CONFIG_DATA/
envsubst </tmp/config.tpl.yml >/tmp/config.yml
mv /tmp/config.yml $TRAEFIK_CONFIG_DATA/

echo "Make runtime user owner of installation directory"
sudo chown -R traefik:traefik $TRAEFIK_INSTALL_DIR
sudo chown -R traefik:traefik $TRAEFIK_DATA

echo "Install Traefik as a service"
envsubst </tmp/traefik.tpl.service >/tmp/traefik.service
sudo mv /tmp/traefik.service /etc/systemd/system/traefik.service
sudo systemctl daemon-reload
sudo systemctl enable traefik.service
sudo systemctl start traefik.service
sudo systemctl status -l traefik.service
