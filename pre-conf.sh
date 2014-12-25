#!/bin/bash
MYSQL_PASSWD=${MYSQL_PASSWD:-mysqlpsswd}
/usr/bin/mysqld_safe &

sleep 5s

mysqladmin -u root password ${MYSQL_PASSWD}
mysqladmin -u root -p${MYSQL_PASSWD} reload

chgrp -R tomcat7 /etc/tomcat7
chmod -R g+w /etc/tomcat7 

killall mysqld
sleep 5s
