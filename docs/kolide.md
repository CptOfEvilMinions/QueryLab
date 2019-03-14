# Kolide

## Install/Setup Kolide OSQuery fleet manager
1. `openssl rand -base64 32`
    1. Copy the output from above
1. `mv group_vars/kolide.example group_vars/kolide.yml`
1. `vim group_vars/kolide.yml` and set:
    1. `kolide_jwt_key` - Set to output from above
    1. `kolide_hostname` - Set hostname for this box
    1. `kolide_mysql_root_user` - Set MySQL root user
    1. `kolide_mysql_root_password` - Set MySQL root password
    1. `kolide_mysql_user` - Set Kolide DB username
    1. `kolide_mysql_pass` - Set Kolide DB password
1. `ansible-playbook -i hosts.ini deploy_kolide.yml -u <user> -K`

## Resources/Sources
* [Kolide - SystemD](https://github.com/kolide/fleet/blob/master/docs/infrastructure/systemd.md)
* [Kolide - Ubuntu](https://github.com/kolide/fleet/blob/master/docs/infrastructure/fleet-on-ubuntu.md)