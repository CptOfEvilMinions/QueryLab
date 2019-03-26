#!/bin/bash
osquery_version="3.3.2"

osquery_conf_url="https://raw.githubusercontent.com/CptOfEvilMinions/QueryLab/master/osquery_configs/macOS/osquery-macOS.conf"
osquery_flag_url="https://raw.githubusercontent.com/CptOfEvilMinions/QueryLab/master/osquery_configs/macOS/osquery.flags"

# Download Osquery
echo "Downloading osquery-$osquery_version.pkg"
curl "https://pkg.osquery.io/darwin/osquery-$osquery_version.pkg" --output /tmp/osquery-$osquery_version.pkg

# Install OSquery
installer -pkg /tmp/osquery-$osquery_version.pkg -target /

# Download Windows osquery.conf
echo "Downloading osquery.conf"
curl $osquery_conf_url --output /var/osquery/osquery.conf

# Download Windows osquery.flags
echo "Downloading osquery.flags"
curl $osquery_flag_url --output /var/osquery/osquery.flags

# Copy lauch daemon
echo "Copy lauch daemon"
cp /var/osquery/com.facebook.osqueryd.plist /Library/LaunchDaemons/

# Start service
echo "Start service"
launchctl load /Library/LaunchDaemons/com.facebook.osqueryd.plist

echo "Done :) - QueryLab"