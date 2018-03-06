#!/bin/bash
#rotate nginx logs
#writen by Aiker
PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
logs_path=/var/log/nginx
d=$(date -d "-1 day" +%F)
mv $logs_path/access.log $logs_path/access_${d}.log
mv $logs_path/error.log $logs_path/error_${d}.log
#向nginx主进程发送USR1信号重新打开日志文件
kill -USR1 $(cat /var/run/nginx.pid)
