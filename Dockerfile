FROM node:20-bullseye

# Perus-Linux-helvetti
RUN apt update && \
    apt install -y openssh-server tmux curl && \
    mkdir /var/run/sshd

# SSH-config
RUN sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# App
WORKDIR /app
COPY . .
RUN npm install

# Setup-scripti
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

EXPOSE 3000 2222

CMD ["/setup.sh"]
