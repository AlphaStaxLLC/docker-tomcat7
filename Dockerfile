#name of container: docker-tomcat7
#versison of container: 0.1.1
FROM quantumobject/docker-baseimage
MAINTAINER Angel Rodriguez "angel@quantumobject.com"

RUN apt-get update && apt-get install -y -q --force-yes tomcat7 \
                                                        tomcat7-common \
                                                        tomcat7-docs \
                                                        tomcat7-admin \
                                                        tomcat7-examples \
                                                        tomcat7-user \
                                                  && apt-get clean \
                                                  && rm -rf /tmp/* /var/tmp/* \
                                                  && rm -rf /var/lib/apt/lists/*

##startup scripts
#Pre-config scrip that maybe need to be run one time only when the container run the first time .. using a flag to don't
#run it again ... use for conf for service ... when run the first time ...
RUN mkdir -p /etc/my_init.d
COPY startup.sh /etc/my_init.d/startup.sh
RUN chmod +x /etc/my_init.d/startup.sh

# to add tomcat7 deamon to runit
RUN mkdir /etc/service/tomcat7
COPY tomcat7.sh /etc/service/tomcat7/run
RUN chmod +x /etc/service/tomcat7/run

#pre-config scritp for different service that need to be run when container image is create
#maybe include additional software that need to be installed ... with some service running ... like example mysqld
COPY pre-conf.sh /sbin/pre-conf
RUN chmod +x /sbin/pre-conf \
              && /bin/bash -c /sbin/pre-conf \
              && rm /sbin/pre-conf
              
##scritp that can be running from the outside using docker-bash tool ...
## for example to create backup for database with convitation of VOLUME dockers-bash container_ID backup_mysql
COPY backup.sh /sbin/backup
RUN chmod +x /sbin/backup
VOLUME /var/backups

# to allow access from outside of the container to the container service
# at that ports need to allow access from firewall if need to access it outside of the server.
EXPOSE 8080

#Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
