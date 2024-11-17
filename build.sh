#!/bin/bash
set -euxo pipefail

# Install 1Password
echo "Installing 1Password..."
curl -LsS https://downloads.1password.com/linux/keys/1password.asc -o /etc/pki/rpm-gpg/RPM-GPG-KEY-1password

cat <<EOF > /etc/yum.repos.d/1password.repo
[1password]
name=1Password Stable Channel
baseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-1password
EOF

# Commit after installing 1Password repo
rpm-ostree install 1password 1password-cli && \
    ostree container commit

# Install Brave Browser
BRAVE_BASEURL="https://brave-browser-rpm-release.s3.brave.com"
KEY_BASEURL="https://brave-browser-rpm-release.s3.brave.com"

echo "Installing Brave Browser..."
curl -LsS $BRAVE_BASEURL/brave-browser.repo -o /etc/yum.repos.d/brave-browser.repo
curl -LsS $KEY_BASEURL/brave-core.asc -o /etc/pki/rpm-gpg/brave-core.asc


rpm-ostree install brave-browser && \
    ostree container commit

# Install additional tools
echo "Installing additional tools..."
rpm-ostree install screen && \
    ostree container commit

echo "Build script completed successfully."

systemctl enable podman.socket