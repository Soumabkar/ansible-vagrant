#!/bin/bash
sudo mkdir -p ~/.ssh
sudo chmod 700 ~/.ssh
sudo mkdir -p ~/.ssh/authorized_keys
sudo chmod 600 ~/.ssh/authorized_keys
sudo cat /home/vagrant/ansible/master_id_rsa.pub | sudo tee -a ~/.ssh/authorized_keys

