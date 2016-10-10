#!/bin/bash

docker build -t="mporium/zookeeper" zookeeper
docker build -t="mporium/storm" storm
docker build -t="mporium/storm-nimbus" storm-nimbus
docker build -t="mporium/storm-supervisor" storm-supervisor
docker build -t="mporium/storm-ui" storm-ui
