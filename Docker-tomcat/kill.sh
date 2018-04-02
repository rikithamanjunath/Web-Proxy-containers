#!/bin/sh
a=0

while [ $a -lt 10 ]
do
   echo $a
   a=`expr $a + 1`
   echo "killing node server/container every minute"
   ps -ef | grep "tomcat" | cut -d ' ' -f6 | xargs sudo kill -9
   sleep 1m
done
