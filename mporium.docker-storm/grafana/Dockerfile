FROM grafana/grafana

MAINTAINER mporium

ADD init.sh /init-grafana.sh
ADD grafana.ini /etc/grafana/grafana.ini
ADD supervisord.conf /etc/supervisord.d/supervisord.conf

# import grafana dashboard
#ADD dash.json /var/lib/grafana/dashboards/dash.json

RUN apt-get update && \
    apt-get -y --no-install-recommends install supervisor netcat-openbsd curl && \
    apt-get clean && \
    bash /init-grafana.sh && \
    apt-get remove -y netcat-openbsd curl && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/lib/grafana/dashboards && \
    chown grafana:grafana /var/lib/grafana/dashboards/

# run
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.d/supervisord.conf"]
