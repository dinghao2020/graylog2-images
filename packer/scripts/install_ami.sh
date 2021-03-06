#!/bin/bash

set -x

if [ -z "$PACKAGE_VERSION" ] ; then
  echo "No Git tag nor Omnibus version set, exiting."
  exit 1
fi
echo "Building image for Graylog $PACKAGE_VERSION"

apt-get update
apt-get dist-upgrade -y
apt-get install -y curl wget rsync vim man sudo avahi-autoipd
apt-get install -y tzdata
apt-get install -y ntp
apt-get install -y ntpdate
wget -O /tmp/graylog.deb https://packages.graylog2.org/releases/graylog-omnibus/ubuntu/graylog_${PACKAGE_VERSION}_amd64.deb
dpkg -i /tmp/graylog.deb
rm /tmp/graylog.deb
echo 'GRAYLOG_INSTALLATION_SOURCE="ami"' > /opt/graylog/embedded/share/graylog/installation-source.sh
