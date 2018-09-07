net2o in a container

Uses the directory ~/net2o of the docker host to store
persistent data such as keys or chat logs. Inside the container
this directory is called /net2o regardless where it is on the
host -- see the -v option below.

```shell
$ mkdir ~/net2o
```

Put a config text file in the net2o directory

```shell
$ cat ~/net2o/config
date=2
chats="/net2o/chats"
keys="/net2o/keys"
.net2o="/net2o"
$
```
optionally copy existing net2o files into this directory keeping the directory structure intact.
Now run the container

```shell
$ docker run -ti --rm -v ~/net2o:/net2o --user $(id -u) mtrute/net2o-container n2o keylist
Passphrase: ••••••  
==== opened: ....
$ docker run -ti --rm -v ~/net2o:/net2o --user $(id -u) mtrute/net2o-container n2o chat groupname
Passphrase: ••••••  
==== opened: ....
...
/bye
$
```
see https://fossil.net2o.de for more information

