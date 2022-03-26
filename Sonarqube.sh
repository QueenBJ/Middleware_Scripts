#!/bin/bash

   #Author: QueenB
   #Date: Feb 22 2022

if 
   [ $USER != root ]
   then
   echo -e "\nYou need root access to run this\n"
   exit 2
   fi

   echo "We are installing sonarqube on Centos7, Please be patient"
   sudo yum update -y

   sudo yum install java-11-openjdk-devel -y

   sudo yum install java-11-openjdk -y

   sleep 2
   cd /opt

   sudo yum install wget -y

   sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip

   sudo yum install unzip -y

   sudo unzip /opt/sonarqube-9.3.0.51899.zip

   sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899

   cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64

   ./sonar.sh start

   echo "Sonarqube installed and started successfully"