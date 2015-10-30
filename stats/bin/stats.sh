#!/bin/bash


STATS_DIR='/home/stats/all'
DATE=`echo $2 | sed -e '1,$ s/-/\//g'`

function stat_all()
{
nfdump -R ${STATS_DIR}/${DATE} '
dst net 192.168.5.0/24 
 or dst net 192.168.100.0/24
  and not src net 192.168.5.0/24
   and not src net 192.168.100.0/24
'
}

function summ_all()
{
nfdump -R ${STATS_DIR}/${DATE} '
dst net 192.168.5.0/24 
 or dst net 192.168.100.0/24
  and not src net 192.168.5.0/24
   and not src net 192.168.100.0/24
' -s dstip/bytes
}

function stat_no_tjk()
{
nfdump -R ${STATS_DIR}/${DATE} '
dst net 192.168.5.0/24 
 or dst net 192.168.100.0/24
  and not src net 192.168.0.0/16
   and not src net 10.0.0.0/8
and not src net 37.98.152.0/20
and not src net 46.20.192.0/20
and not src net 62.122.136.0/21
and not src net 77.95.0.0/21
and not src net 77.244.144.0/23
and not src net 77.244.146.0/24
and not src net 79.170.184.0/21
and not src net 85.9.128.0/18
and not src net 91.200.216.0/22
and not src net 91.218.160.0/22
and not src net 91.218.168.0/22
and not src net 91.218.170.0/23
and not src net 91.231.252.0/22
and not src net 91.235.36.0/22
and not src net 94.199.16.0/21
and not src net 95.142.80.0/20
and not src net 100.64.0.0/10
and not src net 109.68.232.0/21
and not src net 109.74.64.0/20
and not src net 109.75.48.0/20
and not src net 172.16.0.0/12
and not src net 176.113.128.0/20
and not src net 185.23.201.0/24
and not src net 185.42.96.0/22
and not src net 185.78.234.0/24
and not src net 185.78.234.0/23
and not src net 185.78.235.0/24
and not src net 185.105.228.0/22
and not src net 192.168.0.0/16
and not src net 193.111.10.0/23
and not src net 195.140.128.0/23
and not src net 195.246.102.0/23
and not src net 217.8.32.0/20
and not src net 217.11.176.0/20
'
}

function summ_no_tjk()
{
nfdump -R ${STATS_DIR}/${DATE} '
dst net 192.168.5.0/24 
 or dst net 192.168.100.0/24
  and not src net 192.168.0.0/16
   and not src net 10.0.0.0/8
and not src net 37.98.152.0/20
and not src net 46.20.192.0/20
and not src net 62.122.136.0/21
and not src net 77.95.0.0/21
and not src net 77.244.144.0/23
and not src net 77.244.146.0/24
and not src net 79.170.184.0/21
and not src net 85.9.128.0/18
and not src net 91.200.216.0/22
and not src net 91.218.160.0/22
and not src net 91.218.168.0/22
and not src net 91.218.170.0/23
and not src net 91.231.252.0/22
and not src net 91.235.36.0/22
and not src net 94.199.16.0/21
and not src net 95.142.80.0/20
and not src net 100.64.0.0/10
and not src net 109.68.232.0/21
and not src net 109.74.64.0/20
and not src net 109.75.48.0/20
and not src net 172.16.0.0/12
and not src net 176.113.128.0/20
and not src net 185.23.201.0/24
and not src net 185.42.96.0/22
and not src net 185.78.234.0/24
and not src net 185.78.234.0/23
and not src net 185.78.235.0/24
and not src net 185.105.228.0/22
and not src net 192.168.0.0/16
and not src net 193.111.10.0/23
and not src net 195.140.128.0/23
and not src net 195.246.102.0/23
and not src net 217.8.32.0/20
and not src net 217.11.176.0/20
' -s dstip/bytes
}


case "$1" in
  summ_all)
    summ_all
    ;;
  summ_no_tjk)
    summ_no_tjk
    ;;
  stat_all)
    stat_all
    ;;
  stat_no_tjk)
    stat_no_tjk
    ;;
  *)
    echo -e "\n\033[37;1;36mNetflow statistic 
Usage: $0 {stat_all <date>|stat_no_tjk <date>|summ_all <date>|summ_no_tjk <date>}
example: $0 summ_all 2015-10-29 \033[0m\n"
    exit 1
esac
