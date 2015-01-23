collectd-graphite-docker
========================

This project purpose is to monitor network interfaces during penetration tests. 

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
$ ./grmwl create new_project
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

### Workspace

Workspaces are created at ~/.grmwl/ and contains the following

```
├── collectd.conf		#collectd config
├── id				#docker container id
├── local_settings.py		#graphite web settings
├── log				#graphite logs
└── whisper			#graphite data
```

### Monitoring autoconfiguration

The `grmwl build` command take a workspace name and a network interface name to generate a collectd configuration file automagically. We configure collectd to provide the following : 

#### Available

* DNS traffic monitoring with dns plugin
* ICMP echo requests to default gateway (response time, droprate, stddev) with ping plugin
* dropped, errors, octets and packets transmitted over the line with netlink plugin
* device status (speed, duplex, autonegotiation, link status) with ethsys plugin
* curl icanhaszip.com every 30 seconds with curl plugin

#### Soon

* DNS request to default gateway every 10 seconds with dnsrequest plugin
* ARP ping requests to the default gateway

