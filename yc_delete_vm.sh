#!/bin/bash

read -p "Enter VM name to delete: " VM_name

name=`yc compute instance list | grep $VM_name | wc -l`

if [ $name -eq 0 ]

then
        echo "VM does not exist!"
        exit 1

elif
yc compute instance delete $VM_name
then
        echo "VM sucessfully deleted."
else
        echo "Error. VM not deleted."
fi
