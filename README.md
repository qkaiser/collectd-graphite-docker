collectd-graphite-docker
========================

This project purpose is to monitor network interfaces during penetration tests. 

The idea is to have a workspace for each pentest that will have his own container, configuration files and logged data.

Dependencies

* [Docker](http://www.docker.io)
* [collectd](https://collectd.org) (custom build from https://github.com/qkaiser/collectd)


### Commands

#### Create a new workspace

```shell
$ ./grmwl create new_project
```

#### Launching the container

```shell
$ ./grmwl run new_project
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

### Default monitoring settings


