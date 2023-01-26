#!/bin/bash

read -p "Enter Network name to delete: " Network_name
read -p "Enter Subnet name to delete: " Subnet_name

subnet=`yc vpc subnet list | grep $Subnet_name | wc -l`
network=`yc vpc network list | grep $Network_name | wc -l`

if [ $subnet -eq 0 ]
then
        echo "Subnet does not exist!"
elif
yc vpc subnet delete $Subnet_name
then
        echo "Subnet successfully deleted."
else
        echo "Subnet not deleted."
fi

if [ $network -eq 0 ]
then
        echo "Network does not exist!"  
elif
yc vpc network delete $Network_name
then
        echo "Network successfully deleted."
else
        echo "Network not deleted."
fi
