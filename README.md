docker-tomcat7
==============

container running tomcat7 and relate services plus mysql to be use to run war application..

docker run -d -p 8080 quantumobject/docker-tomcat7

check your brownser to port 8080 or port use by docker to connect to it ... 

change password for tomcat7 and for mysql root account if you going to use this container.

or you can entry data when creating the container 

docker run -d -p 8080 -e ADMIN_USER=admin -e ADMIN_PASS=password -e MYSQL_PASSWD=mysqlpasswd quantumobject/docker-tomcat7
