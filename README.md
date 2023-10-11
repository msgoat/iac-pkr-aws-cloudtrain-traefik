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

Originally developed for msg's `Cloud Training Program` and `Cloud Expert Program`.

## Release Information

A changelog can be found in [changelog.md](changelog.md).

## Status

![Build status](https://codebuild.eu-west-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiaXlRTzMwUGk5MTkzcEVZQ29KdkltVkZCR1ZJSnZoSHBlelFzRnVIV1pXTVNnNjFTRWExYmRTK0xxU3ZWaE5pd3Y3TG1PRkwrU1RVZ093a3k0b0F6U1lrPSIsIml2UGFyYW1ldGVyU3BlYyI6IjNMU3k4SzNHWFQrV1Rpak4iLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=main)

## HOW-TO contribute

* Update changelog.md and revision.txt with updated version number whenever you add something.
