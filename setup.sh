#!/bin/bash

usage() {
    echo ""
    echo "${0} <hostname> <encrypt> <private ip 1> <private ip 2>"
    echo ""
    echo "Arguments"
    echo "Hostname     - [REQUIRED] The hostname you want to provide for your consul agent."
    echo "Encrypt      - [REQUIRED] This is acquired by running consul keygen."
    echo "Private IP 1 - [REQUIRED] The private IP address of the bootstrap server."
    echo "Private IP 2 - [REQUIRED] The private IP address of the non bootstrap server."
    echo ""

    return
}

# Check to make sure the correct number of arguments is passed.
if [ "$#" -ne 3 ]; 
then
    usage
    exit
fi

HOSTNAME=$1
PRIVATE_IP1=$2
PRIVATE_IP2=$3

sed -i -- "s/__NODE_NAME__/$HOSTNAME/g" /root/consul_demo/config.json
sed -i -- "s/__BOOTSTRAP_PRIVATE_IP__/$PRIVATE_IP1/g" /root/consul_demo/config.json
sed -i -- "s/__NON_BOOTSTRAP_PRIVATE_IP__/$PRIVATE_IP2/g" /root/consul_demo/config.json
