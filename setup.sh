#!/bin/bash -eu
echo "SEVER SETUP START"

[ -z "`vagrant status | grep running`" ] && echo "Vagrant-Up" && vagrant up

vagrant ssh -- cat .ssh/authorized_keys > authorized_keys

[ `cat authorized_keys | wc -l` == 2 ] && echo "SEVER SETUP END" && exit 1

echo "make public-key"
ssh-keygen -y -f $HOME/.ssh/id_rsa >> authorized_keys

echo "sett ssh-config"
vagrant ssh-config > ssh_config

echo "set public-key"
scp -F ssh_config authorized_keys default:.ssh/authorized_keys

cat <<_EOF_

------------------------------
$ cat $HOME/.ssh/config
Host vagrant
  HostName 127.0.0.1
  User vagrant
  Port 2222
------------------------------

_EOF_
echo "SEVER SETUP END"

