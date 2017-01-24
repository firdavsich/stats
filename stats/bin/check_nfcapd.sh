#!/bin/bash
DAEMON="nfcapd"
EXCLUDE="grep"
PROC_NUM="4"
RESTART="nfcapd -l /home/stats/data/ -S 1 -D -t 3600"
PS="/bin/ps"
GREP="/bin/grep"

if [ `$PS -ax | $GREP $DAEMON | $GREP -v $EXCLUDE | wc -l` -le "$PROC_NUM" ]
then
   $RESTART
   echo "$(date) restart ${DAEMON} " >> /home/stats/log/check_${DAEMON}.log
else
    echo "$(date) ${DAEMON} running" >> /home/stats/log/check_${DAEMON}.log
fi

#ps -ax | grep $DAEMON | grep -v grep | wc -l >> /home/stats/log/check_${DAEMON}.log
