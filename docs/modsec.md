# Modsec

## Install/Setup Modsec for NGINX
1. SSH into the machine

### Compile Modsec
1. `apt-get install -y apt-utils autoconf automake build-essential git libcurl4-openssl-dev libgeoip-dev liblmdb-dev libpcre++-dev libtool libxml2-dev libyajl-dev pkgconf wget zlib1g-dev libssl-dev libxslt-dev libgd2-xpm libgd2-xpm-dev libgeoip-dev libgd-dev`
1. `cd /opt`
1. `git clone --depth 1 -b v3/master --single-branch https://github.com/SpiderLabs/ModSecurity`
1. `cd ModSecurity`
1. `git submodule init`
1. `git submodule update`
1. `./build.sh`
    1. Ignore errors
1. `./configure`
1. `make`
1. `make install`

### Compile Modsec NGINX connector
1. `cd /opt`
1. `git clone --depth 1 https://github.com/SpiderLabs/ModSecurity-nginx.git`
1. `nginx -v`
1. `wget http://nginx.org/download/nginx-<NGINX version>.tar.gz`
1. `tar -zxvf nginx-<NGINX version>.tar.gz`
1. `nginx -V`
    1. Copy all the configure arguments
1. `cd nginx-<NGINX version>`
1. `./configure --with-compat <NGINX COMPILER FLAGS> --add-dynamic-module=../ModSecurity-nginx`
1. `make modules`
1. `mkdir /etc/nginx/modules`
1. `cp objs/ngx_http_modsecurity_module.so /etc/nginx/modules`

### Configure NGINX and Modsec
1. `vim /etc/nginx/nginx.conf`
1. Add `load_module modules/ngx_http_modsecurity_module.so;` to the top
1. Add with server block `modsecurity on;` and `modsecurity_rules_file /etc/nginx/modsec/main.conf;`

### Modsec rules
1. `mkdir /etc/nginx/modsec`
1. `wget -P /etc/nginx/modsec/ https://raw.githubusercontent.com/SpiderLabs/ModSecurity/v3/master/modsecurity.conf-recommended`
1. `mv /etc/nginx/modsec/modsecurity.conf-recommended /etc/nginx/modsec/modsecurity.conf`
1. `sed -i 's/SecRuleEngine DetectionOnly/SecRuleEngine On/' /etc/nginx/modsec/modsecurity.conf`

## Resources/Sources
* [Compiling and Installing ModSecurity for NGINX Open Source](https://www.nginx.com/blog/compiling-and-installing-modsecurity-for-open-source-nginx/)