#!/bin/sh

# Aseta root-salasana
echo "root:root" | chpasswd

# Käynnistä SSH foregroundissa taustalle
/usr/sbin/sshd -D &

# Käynnistä Node ja pidä kontti hengissä
npm start
