#!/bin/bash

cat psyduck.txt

ANSIBLE_GALAXY_PATH="$HOME/.local/bin/ansible-galaxy"
ANSIBLE_PLAYBOOK="$HOME/.local/bin/ansible-playbook"

echo "Greetings. Brewing coffee & setting up Linux Mint..."

sudo apt install python3-yaml python3-resolvelib python3-packaging python3-jinja2 python3-markupsafe python3-pyparsing pipx -y
pipx ensurepath

echo ">> Installing Ansible & ansible-core (Latest)"
pipx install ansible
if [ $? -eq 0 ]; then
    echo Ansible installed successfully
else
    echo Failed to install Ansible
fi

pipx install ansible-core
if [ $? -eq 0 ]; then
    echo ansible-core installed successfully
else
    echo Failed to install ansible-core
fi

echo "Installing community.general from Ansible Galaxy"
$ANSIBLE_GALAXY_PATH collection install community.general

echo "Running playbook for Linux Mint"
$ANSIBLE_PLAYBOOK -K -v -i local.inventory linux_mint.yml

echo "><><><>:: SETUP COMPLETE ::<><><><"

