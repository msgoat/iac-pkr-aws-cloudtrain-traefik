# iac-aws-pkr-cloudtrain-traefik: Packer module 

Builds an AWS AMI supposed to host a [Traefik](https://traefik.io/traefik/) instance.

'/data/traefik/config/trafik.yml' is the location of the static config file of traefik.
The dynamic-config file can be placed in the same dir. Example files are in the ami.