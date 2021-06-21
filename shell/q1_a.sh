#!/bin/bash
#readme：统计http的请求记录
#time:2021-06-20
#author: Mr wu

ProLog=$(pwd)/access.log

function count_http_request() {
    num=`cat ${ProLog} |wc -l`
    echo "Count the total number of HTTP requests recorded by this access logfile:${num}"

}
count_http_request

