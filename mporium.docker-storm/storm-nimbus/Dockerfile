FROM mporium/storm
MAINTAINER mporium

ARG SEQ_URL
ARG SEQ_API_KEY

# configure storm
RUN echo "storm.local.hostname: nimbus" >> $STORM_HOME/conf/storm.yaml && \
    storm/add-storm-process.sh nimbus && \
    storm/add-storm-process.sh drpc

# Install ssh
RUN apt-get update && \
    apt-get install -y openssh-server && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/sshd && \
    chmod 0755 /var/run/sshd && \
    mkdir -p /root/.ssh && \
    chmod 700 /root/.ssh/ && \
    echo "Port 22" >> /etc/ssh/sshd_config && \
    echo "PermitRootLogin without-password" >> /etc/ssh/sshd_config && \
    echo "RSAAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config

ADD id_rsa.pub /root/.ssh/authorized_keys

ADD sshd.conf /etc/supervisor/conf.d/sshd.conf

EXPOSE 6627
EXPOSE 3772
EXPOSE 3773
EXPOSE 3774
EXPOSE 22

CMD storm/start.sh