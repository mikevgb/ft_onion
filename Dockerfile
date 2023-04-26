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

# RUN echo "http://$(cat /var/lib/tor/hidden_service/hostname)"

EXPOSE 4242
EXPOSE 80

# RUN nginx -g 'daemon off;' &
# RUN tor -f /etc/tor/torrc &
# CMD service ssh start && nginx -g 'daemon off;'

# ENTRYPOINT [ "nginx", "-g", "'daemon off;'"]

# CMD service ssh start && tor -f /etc/tor/torrc & sleep 20 && nginx -g 'daemon off;'
# CMD service ssh start && tor -f /etc/tor/torrc

# ENTRYPOINT [ "nginx", "-g", "'daemon off;'"]
#CMD tor -f /etc/tor/torrc & nginx -g 'daemon off;'


# CMD service ssh start && tor -f /etc/tor/torrc & \
#     while ! netstat -tnl | grep -q ':9050 '; do sleep 1; done && \
#     nginx -g 'daemon off;'

# ENTRYPOINT [ "tor", "-f", "/etc/tor/torrc" ]
#configure tor to run as a SOCKS proxy
# RUN echo "SOCKSPort 9050" > /etc/tor/torrc
#start docker
# RUN tor -f /etc/tor/torrc
#ENTRYPOINT [ "tor -f /etc/tor/torrc" ]
#print the address
# RUN echo "http://$(cat /var/lib/tor/hidden_service/hostname)"
# RUN sleep 20 && cat "var/lib/tor/other_hidden_service/hostname"


#open ports for website and ssh


# ENTRYPOINT [ "nginx", "-g", "'daemon off;'"]


# RUN sleep infinity