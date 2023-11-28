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
#!/bin/bash

# Specify Tomcat version
TOMCAT_VERSION="9.0.60"  # Update this to the desired version

# Specify installation directory
INSTALL_DIR="/opt/tomcat"

# Download and extract Tomcat
wget "https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" -P /tmp
sudo mkdir -p ${INSTALL_DIR}
sudo tar xf /tmp/apache-tomcat-${TOMCAT_VERSION}.tar.gz -C ${INSTALL_DIR} --strip-components=1

# Set permissions
sudo chgrp -R root ${INSTALL_DIR}
sudo chmod -R 755 ${INSTALL_DIR}/bin
sudo chmod -R 755 ${INSTALL_DIR}/conf
sudo chmod -R 755 ${INSTALL_DIR}/lib
sudo chmod -R 755 ${INSTALL_DIR}/logs
sudo chmod -R 755 ${INSTALL_DIR}/temp
sudo chmod -R 755 ${INSTALL_DIR}/webapps
sudo chmod -R 755 ${INSTALL_DIR}/work

# Start Tomcat
${INSTALL_DIR}/bin/startup.sh

echo "Tomcat installation and startup complete."
sudo mv /root/shell/gctech/target/*.war /root/apache-tomcat-9.0.83/webapps
                                                                                                                                                    

