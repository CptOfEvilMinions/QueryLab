#!/bin/bash
osquery_version="3.3.2"

osquery_conf_url="https://raw.githubusercontent.com/CptOfEvilMinions/QueryLab/master/osquery_configs/macOS/osquery-macOS.conf"
osquery_flag_url="https://raw.githubusercontent.com/CptOfEvilMinions/QueryLab/master/osquery_configs/macOS/osquery.flags"

# Download Osquery
echo "Downloading osquery-$osquery_version.pkg"
wget "https://pkg.osquery.io/deb/osquery-$osquery_version.pkg" -O /tmp/osquery-$osquery_version.pkg

# Install OSquery
installer -pkg /tmp/osquery_$osquery_version.linux.amd64.deb -target /var/osquery

# Download Windows osquery.conf
echo "Downloading osquery.conf"
wget $osquery_conf_url -O /var/osquery/osquery.conf

# Download Windows osquery.flags
echo "Downloading osquery.flags"
wget $osquery_flag_url -O /var/osquery/osquery.flags

# Copy lauch daemon
echo "Copy lauch daemon"
cp /var/osquery/com.facebook.osqueryd.plist /Library/LaunchDaemons/

# Start service
echo "Start service"
launchctl load /Library/LaunchDaemons/com.facebook.osqueryd.plist

echo "Done :) - QueryLab"