#!/bin/bash
/usr/bin/mysqld_safe &

sleep 5s

mysqladmin -u root password mysqlpsswd
mysqladmin -u root -pmysqlpsswd reload
mysqladmin -u root -pmysqlpsswd create tomcat7

echo "GRANT ALL ON tomcat7.* TO tomcat7user@localhost IDENTIFIED BY 'tomcat7dbpasswd'; flush privileges; " | mysql -u root -pmysqlpsswd

#conf tomcat7 for dspace
#a=$(cat /etc/tomcat7/server.xml | grep -n "</Host>"| cut -d : -f 1 )
#sed -i "$((a-1))r /tmp/dspace_tomcat7.conf" /etc/tomcat7/server.xml
chgrp -R tomcat7 /etc/tomcat7
chmod -R g+w /etc/tomcat7 

killall mysqld
sleep 5s
