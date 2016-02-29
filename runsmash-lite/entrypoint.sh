#/bin/sh

exec $@ --name $HOST_MACHINE-$(hostname -s)
