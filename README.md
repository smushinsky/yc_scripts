# Yandex Cloud Scripts.

## Network and subnet scripts.

### Network and subnet creation script:
```Bash
#!/bin/bash

read -p "Enter Network name: " Network_name
read -p "Enter Subnet name: " Subnet_name

network=`yc vpc network list | grep $Network_name | wc -l`
subnet=`yc vpc subnet list | grep $Subnet_name | wc -l`

if [ $network -gt 0 ]

then
        echo "Network name already exists!"
        exit 1
else
yc vpc network create \
  --name $Network_name \
  --labels my-label=my-value \
  --description "my first network via yc" &>/dev/null

        echo "Network successfully created."    
fi

if [ $subnet -gt 0 ]

then
        echo "Subnet name already exists!"
        exit 1
else
yc vpc subnet create \
  --name $Subnet_name \
  --zone ru-central1-a \
  --range 10.1.2.0/24 \
  --network-name $Network_name \
  --description "my first subnet via yc" &>/dev/null
        echo "Subnet successfully created."
fi
```

### Network and subnet removing script:
```bash
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
```
## Virtual machine scripts.

### Virtual machine creation script:
```bash
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
```

## ### Virtual machine removing script:
```bash
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
```


