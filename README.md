Monitoring
========================

This project purpose is to monitor network connectivity and availability of network services during penetration tests. 

The idea is to have a workspace for each pentest that will have his own container, configuration files and logged data.

Dependencies

* [Docker](http://www.docker.io)
* [collectd](https://collectd.org) (custom build from https://github.com/qkaiser/collectd)


### Commands

#### Init dependencies 


```shell
$ ./grmwl init
```

#### Create a new workspace

```shell
$ ./grmwl build new_project
```

#### Launching the container

This will start the container from project `new_project` with collectd autoconfigured to monitor the `eth0` interface.

```shell
$ ./grmwl start new_project eth0
```

#### Stopping the container

```shell
$ ./grmwl stop new_project
```

#### Deleting the workspace

```shell
$ ./grmwl delete new_project
```

#### List workspaces

```shell
$ ./grmwl list
[+] new_project - running
[+] old_project - stopped
```

### Architecture

Information is gathered by the following process and sent to a graphite server running in a docker container.

* collectd daemon 
* arpmonitoring script
* dnsmonitoring script

The docker container run a graphite server which receive data on port tcp/2003 and provide a web interface on port tcp/8000.
These services are port mapped by docker so you are able to access the web interface by directing your browser to http://localhost:8000/ and http://localhost:8000/dashboard

The configuration files are stored, per workspace, into `~/.grmwl` directory. The `log` directory contains the web server logs while `whisper` contains the actual data so it is persistent.


### Monitoring autoconfiguration

The `grmwl start` command take a workspace name and a network interface name to generate a collectd configuration file automagically. We configure collectd to provide the following : 

* DNS traffic monitoring with dns plugin
* ICMP echo requests to default gateway (response time, droprate, stddev) with ping plugin
* dropped, errors, octets and packets transmitted over the line with netlink plugin
* device status (speed, duplex, autonegotiation, link status) with ethsys plugin
* curl icanhaszip.com every 30 seconds with curl plugin
* DNS request to default gateway every 10 seconds with dnsmonitoring script
* ARP ping requests to the default gateway with arpmonitoring script

### Accessing the interface

Docker will create a port forwarding on port 8000 to the graphite web server. You can direct your browser to [http://localhost:8000/] to access the main interface and [http://localhost:8000/dashboard] 
to access and manage your dashboards.