#!/bin/bash

function stop()
{
 killall fprobe
 killall nfcapd
}

function start()
{
##### start netflow sensor
/usr/sbin/fprobe -iany -fip localhost:9995

##### start netflow collector
nfcapd -l /home/stats/data/ -S 1 -D -t 3600
}

case "$1" in
  start)
    stop
    start
    ;;
  stop)
    stop
    ;;
  status)
    echo "fprobe pid: `pgrep fprobe`"
    echo "nfcapd pid: `pgrep nfcapd`"
    ;;
  *)
    echo "Usage: $0 {netflowd.sh start|stop|status}"
    exit 1
esac
