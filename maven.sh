#!/bin/bash

sudo yum update
sudo yum install git -y
sudo yum install maven -y
sudo yum install java -y
sudo git clone https://github.com/SAITEJABURRA33/gctech.git 
cd gctech
mvn clean install
if [ $? -eq 0 ]; then
    echo "Build successful"
else
    echo "Build failed"
    exit 1  # Exit with an error code
fi
cd
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.83/bin/apache-tomcat-9.0.83.tar.gz
sudo tar -xzvf apache-tomcat-9.0.83.tar.gz
sudo mv /root/gctech/target/*.war /root/apache-tomcat-9.0.83/webapps/
cd /apache-tomcat-9.0.83/bin
./startup.sh
