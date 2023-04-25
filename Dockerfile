FROM nginx:stable

#install stuff
RUN apt update && apt upgrade -y
RUN apt install tor -y
RUN apt install openssh-server -y

RUN mkdir /var/run/sshd

RUN echo 'root:123' | chpasswd
RUN sed -i 's/PermitRootLogin no/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
# #Set password on user NOT RECOMMENDED
# RUN adduser --disabled-password --gecos '' tor

# RUN echo 'tor:123' | chpasswd

# RUN mkdir /home/tor/.ssh && \
#     chmod 700 /home/tor/.ssh && \
#     touch /home/tor/.ssh/authorized_keys && \
#     chmod 600 /home/tor/.ssh/authorized_keys && \
#     chown -R tor:tor /home/tor/.ssh

# RUN sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
#     echo 'PermitRootLogin no' >> /etc/ssh/sshd_config && \
#     echo 'AllowUsers tor' >> /etc/ssh/sshd_config

#enable services
# CMD service ssh start
CMD service ssh start && nginx -g 'daemon off;'
# CMD ["/usr/sbin/sshd", "-D"]

#check if ip address has changed
# RUN curl -x socks5h://localhost:9050 ifconfig.me

#add index.html
# ADD ./index.html ./var/www/html

#restart service in case site is not refreshed
# RUN systemctl restart nginx

#open ports for website and ssh
EXPOSE 4242
EXPOSE 80



# RUN sleep infinity