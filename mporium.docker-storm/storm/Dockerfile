FROM openjdk:8-jre

MAINTAINER mporium 

ENV STORM_VERSION 1.0.2
ENV STORM_HOME /opt/apache-storm-${STORM_VERSION}

RUN apt-get update && \
    apt-get install -y apt-transport-https && \
    wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add - && \
    echo "deb https://packages.elastic.co/logstash/2.4/debian stable main" | tee -a /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y python supervisor logstash less && \
    apt-get remove -y apt-transport-https && \
    apt-get autoremove -y && \
    apt-get clean autoclean && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i -e "\|deb https://packages.elastic.co/logstash/2.4/debian stable main|d" /etc/apt/sources.list && \
    wget -q -O - http://mirrors.sonic.net/apache/storm/apache-storm-${STORM_VERSION}/apache-storm-${STORM_VERSION}.tar.gz | tar -xzf - -C /opt && \
    mkdir /var/log/storm && \
    ln -s $STORM_HOME/bin/storm /usr/bin/storm
    #groupadd storm && \
    #useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm && \
    #chown -R storm:storm $STORM_HOME && \
    #chown -R storm:storm /var/log/storm 

ADD storm.yaml $STORM_HOME/conf/storm.yaml
ADD supervisor-conf.d/ /etc/supervisor/conf.d/
ADD add-storm-process.sh /usr/bin/add-storm-process.sh
ADD logstash-storm.conf /etc/logstash/conf.d/storm.conf
ADD start.sh /usr/bin/start.sh

CMD ["sh", "-c", "/usr/bin/start.sh"]