#!/bin/bash

read -p "Enter VM name: " VM_name
read -p "Enter Subnet name: " Subnet_name

name=`yc compute instance list | grep $VM_name | wc -l`
subnet=`yc vpc subnet list | grep $Subnet_name | wc -l`

if [ $name -gt 0 ]

then
        echo "VM name already exists!"
        exit 1

elif [ $subnet -eq 0 ]

then
        echo "Subnet does not exist!"
        exit 1
else
yc compute instance create \
  --name $VM_name \
  --network-interface subnet-name=$Subnet_name,nat-ip-version=ipv4 \
  --zone ru-central1-a \
  --ssh-key ~/.ssh/id_rsa.pub &>/dev/null

        echo "VM successfully created."
fi
