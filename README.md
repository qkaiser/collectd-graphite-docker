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

This will create the workspace `new_project` with collectd autoconfigured to monitor the `eth0` interface.

```shell
$ ./grmwl create new_project eth0
```

#### Launching the container

```shell
$ ./grmwl start new_project
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
