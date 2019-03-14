# QueryLab

## Deploy Kolide
### Group_vars/all.yml
1. `mv group_vars/all.yml group_vars/all.example`
1. `vim group_vars/all.yml` and set:
    1. `base_domain` - Domain used to access this resource
    1. `timezone` - Timezone for machine
    1. `slack_channel` - Optional
    1. `slack_token` - Optional

### Install/Setup Kolide OSQuery fleet manager
1. [Kolide setup](docs/kolide.md)



## Supported OSes
* Ubuntu Server 18.04 64-bit