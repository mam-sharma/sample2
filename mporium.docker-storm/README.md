docker-storm
============

Dockerfiles for building a storm/zookeeper cluster.
Based on [https://github.com/wurstmeister/storm-docker](https://github.com/wurstmeister/storm-docker)

##Pre-Requisites

- install docker-compose [http://docs.docker.com/compose/install/](http://docs.docker.com/compose/install/)

##Usage

Start a cluster:

- ```docker-compose up```

Destroy a cluster:

- ```docker-compose stop```

Add more supervisors:

- ```docker-compose scale supervisor=3```

##Building

- ```rebuild.sh```

##View the UI

The UI will be normally be visible at: [http://localhost:8080/index.html](http://localhost:8080/index.html)
Where localhost is the docker host machine.

## Deploying Topologies

If you were on the nimbus server then you would normally deploy your with:

    storm jar your-topology-fat-jar.jar com.your.package.TopologyMainClass topology-name 

However, presuming you have the [http://www.mirrorservice.org/sites/ftp.apache.org/storm/apache-storm-1.0.2/apache-storm-1.0.2.tar.gz](storm binaries) installed locally, you can deploy to a remote nimbus server by adding configuration (-c) to specify the nimbus host location (note that port 6627 will need to be reachable):

    storm jar your-topology-fat-jar.jar com.your.package.TopologyMainClass topology-name -c nimbus.host=nimbus_host_name

The above assumes that the nimbus port has not been remapped by the container.  If it has then you would specify it's location with more config:

    storm jar your-topology-fat-jar.jar com.your.package.TopologyMainClass topology-name -c nimbus.host=nimbus_host_name -c nimbus.thrift.port=mapped_port
