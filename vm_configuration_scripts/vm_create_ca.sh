#!/bin/bash

sudo apt-get install easy-rsa

read -p "Enter your login name: " login

mkdir /home/$login/easy-rsa

sudo ln -s /usr/share/easy-rsa/* /home/$login/easy-rsa/

cd /home/$login/easy-rsa

cp openssl-1.0.0.cnf openssl.cnf

read -p "Enter COUNTRY (2 LETTERS): " country
read -p "Enter REGION: " region
read -p "Enter CITY: " city
read -p "Enter ORGANIZATION NAME: " orgname
read -p "Enter EMAIL: " email
read -p "Enter ORGANIZATION UNIT: " ou

sed -i '64s/^#//' vars && sed -i "64s/US/$country/" vars

sed -i '65s/^#//' vars && sed -i "65s/CA/$region/" vars

sed -i '66s/^#//' vars && sed -i "66s/SanFrancisco/$city/" vars

sed -i '67s/^#//' vars && sed -i "67s/Fort-Funston/$orgname/" vars

sed -i '68s/^#//' vars && sed -i "68s/me@myhost.mydomain/$email/" vars

sed -i '69s/^#//' vars && sed -i "69s/MyOrganizationalUnit/$ou/" vars

source ./vars

./clean-all

openssl rand -writerand /home/$login/.rnd

./build-ca