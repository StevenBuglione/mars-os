##!/bin/bash
#set -euxo pipefail
#
## 1Password
#mkdir -p /var/opt
#curl https://downloads.1password.com/linux/keys/1password.asc | tee /etc/pki/rpm-gpg/RPM-GPG-KEY-1password
#sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=0\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-1password" > /etc/yum.repos.d/1password.repo'
#
## Brave Browser
#curl -LsS https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo -o /etc/yum.repos.d/brave-browser.repo
#curl -LsS https://brave-browser-rpm-release.s3.brave.com/brave-core.asc -o /etc/pki/rpm-gpg/brave-core.asc
#
#dnf install -y \
#    1password \
#    1password-cli \
#    brave-browser
#
#systemctl enable podman.socket