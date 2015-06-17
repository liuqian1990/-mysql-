#!/bin/sh
mysql_user="root"
mysql_password="123456"
mysql_port="3306"
mysql_sock="/tmp/mysql.sock"
mysql_host="127.0.0.1"
mysql_dbname="mysql"
mysql_cmd="/usr/local/mysql/bin/mysql -h$mysql_host -u$mysql_user -p$mysql_password -e"
check_port(){
   port=`netstat -an | grep :3306 | grep LISTEN | awk '{print $4}' | sed 's/::://g'`
   if [[ $port==$mysql_port ]];then
       echo "port is listening";
   else
       echo "port is not listened";
   fi
}

check_conn(){
  dbname=`$mysql_cmd "show databases" 2>&- | grep mysql`
  if [[ $dbname==$mysql_dbname ]];then
      echo "mysql can connection";
  else 
      echo "mysql can not connection";
  fi
}
check_conn
check_port
