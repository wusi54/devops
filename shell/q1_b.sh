#!/bin/bash
#readme：统计http的请求记录
#time:2021-06-20
#author: Mr wu

ProLog=$(pwd)/access.log

function count_top_ten_host(){
    echo "Find the top-10 (host) hosts makes most requests from 2019-06-10 00:00:00 to
2019-06-19 23:59:59, inclusively:"
    echo  -e "count\t ip"
    grep -E "1[0-9]/Jun/2019" ${ProLog} |awk '{print $1}'| sort|uniq -c|sort -nr |head -n 10

}
count_top_ten_host