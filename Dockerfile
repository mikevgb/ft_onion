FROM nginx:stable

RUN apt update && apt upgrade tor openssh-server -y

RUN mkdir /var/run/sshd

RUN adduser --disabled-password --gecos '' toradmin
RUN echo 'toradmin:123' | chpasswd
RUN mkdir /home/toradmin/.ssh && \
    mkdir /home/toradmin/insideDockerContainer && \
    chmod 700 /home/toradmin/.ssh && \
    touch /home/toradmin/.ssh/authorized_keys && \
    chmod 600 /home/toradmin/.ssh/authorized_keys && \
    chown -R toradmin:toradmin /home/toradmin/.ssh

COPY sshd_config /etc/ssh/
COPY index.html /usr/share/nginx/html/
COPY torrc /etc/tor/
COPY start.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/start.sh

CMD ["start.sh"]

EXPOSE 4242
EXPOSE 80
