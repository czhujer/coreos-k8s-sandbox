#!/bin/bash
SERVER_IP=<MY_SERVER_IP>

# copy cloud-config.yml to the server
scp cloud-config.yml core@$SERVER_IP:~/

# validate cloud-config file
ssh core@$SERVER_IP "coreos-cloudinit -validate --from-file ~/cloud-config.yml"

if [[ $? == "0" ]]; then
  echo
  echo "Valid configuration"
  echo "  Connect to the server and execute it as root user: "
  echo "      coreos-cloudinit --from-file /home/core/cloud-config.yml"
else
  echo
  echo "Invalid configuration"
fi