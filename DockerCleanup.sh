#!/bin/bash

 #Description:This script will help clean up docker containers and images.
 #Author: QueenB
 #Date: March 8, 2022
 #About this script: Docker containers and images can take up space on your system. This script will help delete them and clear up space. It will:  
        #- Stop all running containers
        #- Remove containers
        #- Remove images

echo "Let's verify your identity before proceeding."
echo
sleep 2
echo "Please enter your username:"
echo
read U
 id $U
if
[ $? -eq 0 ]
then
echo
echo "Warning!!! This script will remove ALL containers and images."
echo
echo "Do you wish to proceed?"
sleep 3
while true
do
echo "Enter yes / no"
read n
if
[ $n = "yes" ]
then
echo "Docker containers will now be stopped."
docker stop $(docker ps -aq)
sleep 2
echo
echo "Removing stopped containers..."
sleep 2
docker rm $(docker ps -aq)
echo
echo " Removing all images..."
sleep 2
docker rmi -f $(docker images -q)
break
elif [ $n = no ]
then
echo "No containers or images will be deleted."
exit
fi
done
fi