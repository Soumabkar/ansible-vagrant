#!/bin/bash

#!/bin/bash

# Chemin vers la clé privée
KEY_PATH="/home/vagrant/.ssh/id_rsa"

# Vérifier si la clé existe
if [ -f "$KEY_PATH" ]; then
    echo "La clé SSH $KEY_PATH existe déjà."
    ls -l "$KEY_PATH"
else
    echo "La clé SSH $KEY_PATH n'existe pas. Génération en cours..."
    mkdir -p /home/vagrant/.ssh
    ssh-keygen -t rsa -b 2048 -f "$KEY_PATH" -q -N ""
    chmod 600 "$KEY_PATH"
    chown vagrant:vagrant "$KEY_PATH"
    echo "Clé SSH générée avec succès : $KEY_PATH"
    ls -l "$KEY_PATH"
fi

sudo apt update
sudo apt install python3-pip -y
pip3 install --user pywinrm
#apt install python3-venv -y
#sudo pip3 install docker-py
# Docker installation
# sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt update
# sudo apt install -y docker-ce docker-ce-cli containerd.io
# sudo systemctl enable --now docker
# sudo usermod -aG docker vagrant

# Ansible with Windows

#sudo pip3 install pywinrm




#cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
sudo apt-get update
sudo apt-get install -y ansible

ansible-galaxy collection install ansible.windows
ansible-galaxy collection install community.windows

mkdir -p ~/ansible

