#!/bin/bash
#project ID and keys location should be gendrated and replaced 

echo -e "Enter \e[33mserver name\e[0m to be deployed"
read instancename
echo -e "\nEnter the \e[33mMachine type\e[0m \nExample:\nn1-standard-1\nn1-standard-4\nWAITING FOR YOUR INPUT:"
read machinetype

cat <<EOF > /home/e_vishnu55/Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "google/gce"

  config.vm.provider :google do |google, override|
  google.google_project_id = "689651055144"
  google.google_json_key_location = "/etc/ansible/gcp_serviceaccount_keys.josn"
  google.image_family = 'ubuntu-1804-lts'
  google.name = "$instancename"
  google.machine_type = "$machinetype"
  google.zone="us-central1-a"

  override.ssh.username = "e_vishnu55"
  override.ssh.private_key_path = "~/.ssh/id_rsa"
  end
end
EOF

echo "HOLD ON TIGHT, AN INSTANCE IS BEING FIRED UP FOR YOU ;)"
vagrant up --provider=google
