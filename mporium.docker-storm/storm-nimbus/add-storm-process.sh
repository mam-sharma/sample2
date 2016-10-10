#!/bin/bash

cp /etc/supervisor/conf.d/storm.conf.template /etc/supervisor/conf.d/storm-$1.conf
sed -i -e "s/{{PROC}}/$1/g" /etc/supervisor/conf.d/storm-$1.conf

sed -i -e 's|input {|input {\
  file {\
      path => "'"/var/log/storm/$1.log"'"\
  }|g' /etc/logstash/conf.d/storm.conf