collectd-graphite-docker
========================

Run mackerel/graphite docker container, install and configure collectd locally to monitor network.

This is what should happen:

```shell
quentin@grmwl:~/git/graphite$ sudo make
apt-get install -y collectd
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  ax25-node libax25 openbsd-inetd
Use 'apt-get autoremove' to remove them.
The following NEW packages will be installed:
  collectd
0 upgraded, 1 newly installed, 0 to remove and 75 not upgraded.
Need to get 16,4 kB of archives.
After this operation, 165 kB of additional disk space will be used.
Get:1 http://be.archive.ubuntu.com/ubuntu/ trusty/universe collectd amd64 5.4.0-3ubuntu2 [16,4 kB]
Fetched 16,4 kB in 0s (40,2 kB/s)   
Selecting previously unselected package collectd.
(Reading database ... 284684 files and directories currently installed.)
Preparing to unpack .../collectd_5.4.0-3ubuntu2_amd64.deb ...
Unpacking collectd (5.4.0-3ubuntu2) ...
Setting up collectd (5.4.0-3ubuntu2) ...
 * Restarting statistics collection and monitoring daemon collectd                                                                                                                                                  configfile: stat (/etc/collectd/thresholds.conf) failed: No such file or directory
[2014-12-03 10:11:08] ping plugin: MaxMissed < 0, disabled re-resolving of hosts
configfile: stat (/etc/collectd/thresholds.conf) failed: No such file or directory
[2014-12-03 10:11:10] ping plugin: MaxMissed < 0, disabled re-resolving of hosts
                                                                                                                                                                                                             [ OK ]
cp collectd.conf /etc/collectd/collectd.conf
service collectd restart
 * Restarting statistics collection and monitoring daemon collectd                                                                                                                                                  configfile: stat (/etc/collectd/thresholds.conf) failed: No such file or directory
[2014-12-03 10:11:10] ping plugin: MaxMissed < 0, disabled re-resolving of hosts
configfile: stat (/etc/collectd/thresholds.conf) failed: No such file or directory
[2014-12-03 10:11:12] ping plugin: MaxMissed < 0, disabled re-resolving of hosts
                                                                                                                                                                                                             [ OK ]
Pulling repository mackerel/graphite
e9ecb3c81eb8: Download complete 
511136ea3c5a: Download complete 
638fd9704285: Download complete 
61f7f4f722fb: Download complete 
00a1e1c65185: Download complete 
4580735402d6: Download complete 
0a5297ee1483: Download complete 
ccc2288e830f: Download complete 
05ca4a13bcb6: Download complete 
fa79455e778a: Download complete 
fd05d1448a4e: Download complete 
02e337c19ab7: Download complete 
9affdc024f7c: Download complete 
808cae116a65: Download complete 
f3458f63ad2e: Download complete 
9e3867d4c375: Download complete 
6d1428053458: Download complete 
582aa0d1af7b: Download complete 
989b09d7be4f: Download complete 
51f47431b897: Download complete 
66b011630523: Download complete 
c38bf29d455c: Download complete 
a61b7bc37687: Download complete 
89ac10803896: Download complete 
c1059340b447: Download complete 
197ae1333681: Download complete 
9555523db2e2: Download complete 
b7c08f2fe0e3: Download complete 
2bf7f07adf8e: Download complete 
8fba368ce145: Download complete 
5513ae376a1e: Download complete 
1276e90ab41b: Download complete 
6b17788ade19: Download complete 
fa2ea06f9aa3: Download complete 
95a8cadaf6b8: Download complete 
d480fcbb212b: Download complete 
d3f5af479c82: Download complete 
ffcd71e413768a5cf8390b71ca29ed614044dcdaf788b59c8f152c6ce468d84e
Open your browser and go to http://localhost:8000/ to open Graphite UI.
```
