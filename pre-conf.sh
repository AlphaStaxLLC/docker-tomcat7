#!/bin/bash
/usr/bin/mysqld_safe &

sleep 5s

mysqladmin -u root password mysqlpsswd
mysqladmin -u root -pmysqlpsswd reload

chgrp -R tomcat7 /etc/tomcat7
chmod -R g+w /etc/tomcat7 

killall mysqld
sleep 5s
