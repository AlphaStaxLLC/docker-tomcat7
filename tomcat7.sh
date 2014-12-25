#!/bin/bash
MAX_UPLOAD_SIZE=${MAX_UPLOAD_SIZE:-52428800}
CATALINA_OPTS=${CATALINA_OPTS:-"-Xms128m -Xmx1024m -XX:PermSize=128m -XX:MaxPermSize=256m"}

export CATALINA_OPTS="${CATALINA_OPTS}"
export CATALINA_HOME="/usr/share/tomcat7"
export CATALINA_BASE="/var/lib/tomcat7"

exec /usr/share/tomcat7/bin/catalina.sh run >>/var/log/tomcat7.log 2>&1
