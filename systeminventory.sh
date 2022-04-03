#!/bin/bash
#Author: QueenB
#Description: System Inventory

CPU=`nproc`
Cpu_Speed=`lscpu | grep -i '^CPU MHz:'`
Hard_Drive=`lsblk | awk '{print$1, $4}'`
Memory=`free -m | awk '{print$1, $2}'`
BIT=`getconf LONG_BIT`
OS=`cat /etc/os-release | grep ^ID= | awk -F '"' '{print$2}'`
Up_time=`uptime -p`
kernel_version=`uname -a | awk '{print$1, $3}' | cut -c 1-12`

#User authentication before running the program
if [ $UID != 0 ]
    then
    echo -e "\nYou need root access to run this\n"
    exit 1
fi

#Display System health check

echo -e "\nSYSTEM HEALTH CHECK PROCESSING... \n"
sleep 3

echo "The number of cpu(s) on the server is: "
echo $CPU 
sleep 1
echo
echo "The speed of that cpu is: "
echo $Cpu_Speed
sleep 1
echo
echo "Number of Hard Drives with their sizes :"
echo $Hard_Drive
sleep 1
echo
echo "total memory on the system : "
echo $Memory
sleep 1
echo
echo "The system bitness :"
echo $BIT
sleep 1
echo
echo "Your Linux Operation system flavor is : "
echo $OS
sleep 1
echo
echo "The system operation time : "
echo $Up_time
sleep 1
echo
echo "The Kernel Version : "
echo $kernel_version
sleep 1
echo