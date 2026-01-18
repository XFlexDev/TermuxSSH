FROM node:20-bullseye

# Asenna perushelvetti
RUN apt update && \
    apt install -y openssh-server tmux curl && \
    mkdir /var/run/sshd

# SSH-konffi
RUN sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

WORKDIR /app
COPY . .
RUN npm install

COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

EXPOSE 3000 2222

CMD ["/setup.sh"]
