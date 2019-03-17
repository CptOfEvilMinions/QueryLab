---
layout: page
title: 'Setup'
---

# OSquery host configs
* [OSquery config for Windows](https://github.com/CptOfEvilMinions/QueryLab/tree/master/osquery_configs/Windows)
* [OSquery config for Linux](https://github.com/CptOfEvilMinions/QueryLab/tree/master/osquery_configs/Linux)
* [OSquery config for macOS](https://github.com/CptOfEvilMinions/QueryLab/tree/master/osquery_configs/macOS)

# Option 1 - Community

## Install/Setup OSquery on Windows


## Install/Setup OSquery on Linux


## Install/Setup OSquery on macOS


# Option 2 - Paranoid

## Install/Setup OSquery on Windows
A [Powershell script](https://github.com/CptOfEvilMinions/QueryLab/blob/master/osquery_configs/Windows/setup.ps1) has been provided to download/install OSquery and then pull down [OSquery configs for Windows](https://github.com/CptOfEvilMinions/QueryLab/tree/master/osquery_configs/Windows). This script accepts several command line arugments such as: `osquery_version`, `osquery_flag_url`, `osquery_conf_url`.

1. `Open Powershell as Administrator`
1. `Invoke-Webrequest https://raw.githubusercontent.com/CptOfEvilMinions/QueryLab/master/osquery_configs/Windows/setup.ps1 -OutFile setup.ps1`
1. `.\setup.ps1`
    1. `Set-ExecutionPolicy Unrestricted`
    1. ![Windows-osquery-setup](/assets/images/windows-osquery-setup.png)

## Install/Setup OSquery on Linux
A [BASH script](https://github.com/CptOfEvilMinions/QueryLab/blob/master/osquery_configs/Linux/setup.sh) has been provided to download/install OSquery and then pull down [OSquery configs for Linux](https://github.com/CptOfEvilMinions/QueryLab/tree/master/osquery_configs/Linux). This script accepts several command line arugments such as: `osquery_version`, `osquery_flag_url`, `osquery_conf_url`.

1. `Open a terminal as Administrator`
1. `wget https://raw.githubusercontent.com/CptOfEvilMinions/QueryLab/master/osquery_configs/Linux/setup.sh`
1. `./setup.sh`
    1. ![Linux-osquery-setup](/assets/images/Linux-osquery-setup.png)

### Supported OSes
* Ubuntu Server 18.04 64-bit
* CentOS 7 64-bit

## Install/Setup OSquery on macOS
A [BASH script](https://github.com/CptOfEvilMinions/QueryLab/blob/master/osquery_configs/macOS/setup.sh) has been provided to download/install OSquery and then pull down [OSquery configs for Linux](https://github.com/CptOfEvilMinions/QueryLab/tree/master/osquery_configs/macOS). This script accepts several command line arugments such as: `osquery_version`, `osquery_flag_url`, `osquery_conf_url`.
1. `Open a terminal as Administrator`
1. `wget https://raw.githubusercontent.com/CptOfEvilMinions/QueryLab/master/osquery_configs/macOS/setup.sh`
1. `./setup.sh`

## Resources/Sources

