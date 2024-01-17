#!/bin/bash
GIT_REPOSITORY="https://github.com/courmontf/sensor_dht11.git"
INSTALL_DIR="/opt/sensor_dht11"
SUDO="sudo"

if ! which sudo >/dev/null; then
	SUDO=""

	if [ "$(id -u)" -ne 0 ]; then
		echo "\nInsufficient privileges:\n"
		echo "Please run this script as root."
		exit 1
	fi
fi

$SUDO apt-get install libgpiod2
git clone $GIT_REPOSITORY /tmp/sensor_dht11
cd /tmp/sensor_dht11/sensor_dht11
$SUDO cp -r /tmp/sensor_dht11/sensor_dht11 $INSTALL_DIR
cd $INSTALL_DIR
$SUDO chown -R $(whoami) .
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
$SUDO chown -R root:root .
$SUDO cp sensor_dht11.service /lib/systemd/system/sensor_dht11.service
$SUDO chmod -R +x $INSTALL_DIR
$SUDO useradd sensor_dht11 -G gpio -M -r
$SUDO systemctl daemon-reload
$SUDO systemctl enable sensor_dht11.service
$SUDO systemctl start sensor_dht11
$SUDO rm -r /tmp/sensor_dht11
