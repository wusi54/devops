#!/bin/bash
#readme：根据ip地址统计访问量最多的国家
#time:2021-06-20
#author: Mr wu

ProLog=$(pwd)/access.log
IpApi='http://demo.ip-api.com/line'
country=''
function access_most_country() {
    > country.txt
    ipList=`awk '{print$1}' $ProLog |sort -nr |uniq`
    for ip in $ipList
    do
      res=`curl -sSL  --connect-timeout 5 $IpApi -d '\{\"ip\":\"29.3.22.13\",\"lang\":\"cn\"\}'| head -n 2`
      status=$(echo ${res}|awk '{print$1}')
      if [[ ${status} == 'success' ]];then
          ret=`echo ${res}|awk '{print$2}'`
          countrys=${country}' '$ret
          echo "$ip" "$ret"
          echo "$ip" "$ret" >> country.txt
      fi
    done
    country=`echo $countrys |awk '{for(i=1;i<=NF;i++)print $i}'|sort |uniq -c |sort -nr |head -n 1`
    echo "Find out the country with most requests originating from (according to the source
IPs):${country}"
}
access_most_country

