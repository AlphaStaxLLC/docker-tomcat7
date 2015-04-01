# docker-tomcat7

Docker container for [tomcat7][3]

Container running tomcat7 and relate services plus mysql to be use to run war application.

"Apache Tomcat version 7.0 implements the Servlet 3.0 and JavaServer Pages 2.2 [specifications][6] from the [Java Community Process][7], and includes many additional features that make it a useful platform for developing and deploying web applications and web services."

## Install dependencies

  - [Docker][2]

To install docker in Ubuntu 14.04 use the commands:

    $ sudo apt-get update
    $ sudo apt-get install docker.io

 To install docker in other operating systems check [docker online documentation][4]

## Usage

To run container use the command below:

    $ docker run -d -p 8080 quantumobject/docker-tomcat7

with default configuration:

  - MYSQL_PASSWD: mysqlpsswd
  - ADMIN_USER: admin
  - ADMIN_PASS: tomcat
  
or you can provide your own value when running the first time:

    $ docker run -d -p 8080 -e ADMIN_USER=admin -e ADMIN_PASS=password -e MYSQL_PASSWD=mysqlpasswd quantumobject/docker-tomcat7
    
## Accessing the Tomcat7 applications:

After that check with your browser at addresses plus the port assigined by docker for port 8080:

  - **http://host_ip:port/**

## More Info

About tomcat7 [tomcat.apache.org][1]

To help improve this container [quantumobject/docker-tomcat7][5]

Example of WAR application running on docker-tomcat7: [OpenMRS][8]

Exaple of [Tomcat7][9]

[1]:https://tomcat.apache.org/index.html
[2]:https://www.docker.com
[3]:https://tomcat.apache.org/tomcat-7.0-doc/index.html
[4]:http://docs.docker.com
[5]:https://github.com/QuantumObject/docker-tomcat7
[6]:http://wiki.apache.org/tomcat/Specifications
[7]:https://www.jcp.org/en/home/index
[8]:www.quantumobject.com:49164/openmrs-1.10.0/index.htm
[9]:www.quantumobject.com:49164/
