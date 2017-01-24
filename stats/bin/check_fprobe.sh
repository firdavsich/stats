#!/bin/sh
DAEMON="fprobe"
EXCLUDE="grep"
PROC_NUM="4"
RESTART="/usr/sbin/fprobe -iany -fip localhost:9995"
PS="/bin/ps"
GREP="/bin/grep"

if [ `$PS -ax | $GREP $DAEMON | $GREP -v $EXCLUDE | wc -l` -le "$PROC_NUM" ]
then
   $RESTART
   echo "$(date) restart ${DAEMON} " >> /home/stats/log/check_${DAEMON}.log
else
    echo "$(date) ${DAEMON} running" >> /home/stats/log/check_${DAEMON}.log
fi

