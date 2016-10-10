#!/bin/bash

echo "Environment: ${IMPACT_ENVIRONMENT}, ${SEQ_URL}, ${SEQ_API_KEY}."

sed -i -e "s|{{ENVIRONMENT}}|${IMPACT_ENVIRONMENT}|g" /etc/logstash/conf.d/storm.conf
sed -i -e "s|{{SEQ_URL}}|${SEQ_URL}|g" /etc/logstash/conf.d/storm.conf
sed -i -e "s|{{SEQ_API_KEY}}|${SEQ_API_KEY}|g" /etc/logstash/conf.d/storm.conf

exec supervisord -n -c /etc/supervisor/supervisord.conf