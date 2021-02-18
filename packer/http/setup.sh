#!/usr/bin/env bash

mkdir -p /root/.archsugar
echo root:vagrant | chpasswd
/usr/bin/systemctl start sshd.service
