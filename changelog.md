# Changelog
All notable changes to `iac-pkr-aws-cloudtrain-traefik` will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased] - YYYY-MM-DD
### Added
### Changed
### Fixed

## [3.1.0] - 2023-12-27
### Added
- Added reference to CodeBuild Build ID to AMI tags
### Changed
- Changed versioning schema to allow multiple builds on the same git commit by adding the build number to the fully qualified version
- Updated AMI tags referring to AMI maintainer
- Consolidated CodeBuild build specification

## [3.0.1] - 2023-12-22
### Fixed
- Moved templates for Traefik configuration files to /opt/traefik/tpl since /tmp folder does not survive instantiation

## [3.0.0] - 2023-12-20
### Changed
- Upgraded OS to Amazon Linux 2023
- Replaced package manager yum with new default dnf
- Upgraded Traefik to version v2.10.7

## [2.1.0] - 2023-10-13
### Changed
- Replaced personal email address in LetEncrypt ACME config with CXP email address
- Upgraded Traefik to v2.10.5

## [2.0.0] - 2023-10-11
### Changed
- Added AWS CodeBuild support

## [1.5.0] - 2023-09-01
### Changed
- Upgraded Traefik to v2.10.4
