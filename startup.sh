#!/bin/bash

set -e

if [ -f /etc/configured ]; then
  echo 'already configured'
else
  #code that need to run only one time ....
  /usr/bin/mysqld_safe &
  sleep 5s
  MYSQL_PASSWD=${MYSQL_PASSWD:-mysqlpsswd}
  ADMIN_USER=${ADMIN_USER:-admin}
  ADMIN_PASS=${ADMIN_PASS:-tomcat}
  
  mysqladmin -u root password ${MYSQL_PASSWD}

cat << EOF > /etc/tomcat7/tomcat-users.xml
<?xml version='1.0' encoding='utf-8'?>
<tomcat-users>
<user username="${ADMIN_USER}" password="${ADMIN_PASS}" roles="admin-gui,manager-gui"/>
</tomcat-users>
EOF
  killall mysqld
  sleep 5s
  #needed for fix problem with ubuntu and cron
  update-locale
  date > /etc/configured
fi
