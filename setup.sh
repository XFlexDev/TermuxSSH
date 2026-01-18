#!/bin/sh

echo "root:root" | chpasswd

# Käynnistä SSH
/usr/sbin/sshd

# Käynnistä Node-appi
npm start
