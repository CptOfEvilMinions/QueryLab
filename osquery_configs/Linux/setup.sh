#!/bin/bash
osquery_ubuntu_version="3.3.2_1"
osquery_centos_version="3.3.2-1"

osquery_conf_url="https://raw.githubusercontent.com/CptOfEvilMinions/QueryLab/master/osquery_configs/Linux/osquery-linux.conf"
osquery_flag_url="https://raw.githubusercontent.com/CptOfEvilMinions/QueryLab/master/osquery_configs/Linux/osquery.flags"


osquery_install_ubuntu() {
    # OSuery version
    osquery_version=$osquery_ubuntu_version

    # Download Osquery
    echo "Downloading osquery_$osquery_version.linux.amd64.deb"
    wget "https://pkg.osquery.io/deb/osquery_$osquery_version.linux.amd64.deb" -O /tmp/osquery_$osquery_version.linux.amd64.deb

    # Install OSquery
    dpkg -i /tmp/osquery_$osquery_version.linux.amd64.deb

    # Download configs
    osquery_configs

    # Restart service
    systemctl restart osqueryd

    # Print service status
    systemctl status osqueryd

    echo "Done :) - QueryLab"

}

osquery_install_centos() {
    #Osquery version
    osquery_version=$osquery_centos_version
    
    # Download Osquery
    echo "Downloading osquery-$osquery_version.linux.x86_64.rpm"
    wget "https://pkg.osquery.io/rpm/osquery-$osquery_version.linux.x86_64.rpm" -O /tmp/osquery_$osquery_version.linux.x86_64.rpm

    # Install OSquery
    rpm -Uvh /tmp/osquery_$osquery_version.linux.x86_64.rpm

    # Download configs
    osquery_configs

    # Restart service
    systemctl restart osqueryd

    # Print service status
    systemctl status osqueryd

    echo "Done :) - QueryLab"
}

osquery_configs() {
    # Download Windows osquery.conf
    wget $osquery_conf_url -O /etc/osquery/osquery.conf

    # Download Windows osquery.flags
    wget $osquery_flag_url -O /etc/osquery/osquery.flags
}

echo "Check OS"
if [ -f /etc/redhat-release ]; then
    echo "Installing OSquery for Centos"
    osquery_install_centos
fi

if [ -f /etc/lsb-release ]; then
    echo "Installing OSquery for Ubuntu"
    osquery_install_ubuntu
fi