#!/bin/bash

declare -a dict


# print current vms and output to dictionary
vagrant_vm=$(ls .vagrant/machines/) 
for i in $vagrant_vm; do
  n=$((n + 1))
  output="$n $i"
  echo $output
  declare "dict_$n=$i"
done


# define get value for the array index
arrayGet() {
  local array=$1 index=$2
  local i="${array}_$index"
  s="${!i}"
  echo $s
}


# user prompt for number
printf "choose vm number:"
read vm_number

# get vm name
vm=$(arrayGet dict "$vm_number")
echo $vm

#get port
port=$(vagrant.exe port $vm  | grep 22 | awk '{ print $4 }')

echo $port

#ssh
key=".vagrant/machines/$vm/virtualbox/private_key"
ssh -i $key vagrant@127.0.0.1 -p $port
