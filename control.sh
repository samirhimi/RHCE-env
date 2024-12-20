#!/bin/sh

echo "Control Node Preparation ..."

dnf update -y
dnf install -y python39 epel-release wget curl

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd

export PATH="/usr/local/bin:$PATH"
source  ~/.bash_profile

PASS=$(echo "redhat" | openssl passwd -1 -stdin)
useradd -p "$PASS" student
usermod -aG wheel student
echo "student ALL=(ALL)  NOPASSWD: ALL" >> /etc/sudoers.d/student

cat <<EOF > /etc/hosts
172.25.250.9 workstation.lab.example.com  workstation
172.25.250.10 servera.lab.example.com servera
172.25.250.11 serverb.lab.example.com serverb
172.25.250.12 serverc.lab.example.com serverc
172.25.250.13 serverd.lab.example.com serverd
EOF
