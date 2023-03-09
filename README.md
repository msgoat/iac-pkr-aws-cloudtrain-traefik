# iac-pkr-aws-cloudtrain-traefik: Packer module 

Builds an AWS AMI supposed to host a [Traefik](https://traefik.io/traefik/) instance.

The Traefik binary folder is `/opt/traefik`.
The Traefik data folder is `/opt/traefik/data`.
All Traefik configuration files are put into folder `/opt/traefik/data/config`.

Traffic starts as a service but (obviously) does not have any backends.

Templates for configuration files are provided in directory `/tmp`:

* `config.tpl.yml` is a template for the dynamic configuration.
* `traefic.tpl.service` is a template for the service configuration.
* `traefic.tpl.yml` is a template for the static configuration.

> Attention: The location of the Traefik data folder `/opt/traefik/data` must be changed if you want to keep the 
> data on a separate data volume!