# AppArmor

## Install/Setup
1. `apt install apparmor-utils -y`

### AppArmor for Koldie
1. 
```
cat > /etc/apparmor.d/usr.local.bin.fleet << 'EOF'
#include <tunables/global>

/usr/local/bin/fleet {
  #include <abstractions/base>

  capability net_admin,

  network inet,
  network inet6,

  /etc/kolide/kolide.yml r,
  /var/log/kolide/** rw,
  /proc/sys/net/core/somaxconn r,
  /etc/mime.types r,
  /etc/nsswitch.conf r,
  /run/systemd/resolve/stub-resolv.conf r,
  /etc/hosts r,
  /etc/ssl/certs/** r,
}
EOF
```
1. `aa-enforce usr.local.bin.fleet`

### AppArmor for NGINX
1. 
```
cat > /etc/apparmor.d/usr.sbin.nginx << 'EOF'
#include <tunables/global>

/usr/sbin/nginx {
  #include <abstractions/base>
  #include <abstractions/lxc/container-base>
  capability dac_override,
  capability dac_read_search,
  capability net_bind_service,
  capability setgid,
  capability setuid,

  /lib/x86_64-linux-gnu/ld-*.so mr,
  /usr/sbin/nginx mr,
  /usr/share/nginx/html/wordpress/* r,
  /etc/group r,
  /etc/nginx/conf.d/ r,
  /etc/nginx/mime.types r,
  /etc/nginx/nginx.conf r,
  /etc/nginx/modsec/* r,
  /etc/nginx/modules/ngx_http_modsecurity_module.so mr,
  /etc/nsswitch.conf r,
  /etc/passwd r,
  /etc/ssl/openssl.cnf r,
  /run/nginx.pid rw,
  /usr/sbin/nginx mr,
  /var/log/nginx/access.log w,
  /var/log/nginx/error.log w,
}
```
1. `aa-enforce usr.sbin.nginx`

## Resources/Soirces