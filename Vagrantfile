Vagrant.configure("2") do |config|
config.vm.boot_timeout = 1200  # Temps d'attente de 1200 secondes (20 minutes)
config.vm.box = "ubuntu/jammy64"

config.vbguest.auto_update = false

config.vm.provider "virtualbox" do |vb|
  vb.memory = "2048"
  vb.cpus = 2
end

  # Configuration de la machine master
  config.vm.define "master" do |master|

    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "192.168.56.10"

    # Provisionnement du script de configuration de la machine master
    master.vm.provision "shell", path: "provision_master.sh"
    # Provisionnement du fichier hosts.ini
    master.vm.provision "file", source: "hosts.ini", destination: "/home/vagrant/ansible/hosts.ini"
    master.vm.provision "file", source: "playbook.yml", destination: "/home/vagrant/ansible/playbook.yml"
    master.vm.provision "file", source: "test_2/install-apache.yml", destination: "/home/vagrant/ansible/install-apache.yml"
    master.vm.provision "file", source: "test_2/rec-apache-1.inv", destination: "/home/vagrant/ansible/node1.inv"
    master.vm.provision "file", source: "test_2/rec-apache-1.yml", destination: "/home/vagrant/ansible/node1.yml"
    master.vm.provision "file", source: "test_2/test.html", destination: "/home/vagrant/ansible/test.html"

    master.vm.provision "file", source: "chapitre-04/chapitre-04/vault/intranet-application.yml", destination: "/home/vagrant/ansible/chapitre-04/intranet-application.yml"
    master.vm.provision "file", source: "chapitre-04/chapitre-04/vault/intranet-pass.yml", destination: "/home/vagrant/ansible/chapitre-04/intranet-pass.yml"
    master.vm.provision "file", source: "chapitre-04/chapitre-04/vault/partial-vault.yml", destination: "/home/vagrant/ansible/chapitre-04/partial-vault.yml"
    master.vm.provision "file", source: "chapitre-04/chapitre-04/vault/vault.key", destination: "/home/vagrant/ansible/chapitre-04/vault.key"

    master.vm.provision "file", source: "chapitre-04/chapitre-04/inventory/docker_swarm.yml", destination: "/home/vagrant/ansible/chapitre-04/docker_swarm.yml"
    master.vm.provision "file", source: "chapitre-04/chapitre-04/inventory/docker.py", destination: "/home/vagrant/ansible/chapitre-04/docker.py"
    master.vm.provision "file", source: "chapitre-04/chapitre-04/inventory/docker.yml", destination: "/home/vagrant/ansible/chapitre-04/docker.yml"


    master.vm.provision "shell", path: "create_deploy_user.sh"

    # Optionnel : rendre le fichier exécutable ou modifier les permissions
    master.vm.provision "shell", inline: <<-SHELL
      chown vagrant:vagrant /home/vagrant/ansible/hosts.ini
      chmod 644 /home/vagrant/ansible/hosts.ini
      chown vagrant:vagrant /home/vagrant/ansible/playbook.yml
      chmod 644 /home/vagrant/ansible/playbook.yml
      SHELL

  end

  # Configuration de la machine node1 add_master_key_to_node_authorized_keys
  config.vm.define "node1" do |node1|
    node1.vm.hostname = "node1"
    node1.vm.network "private_network", ip: "192.168.56.11"

    node1.vm.provision "file", source: "master_id_rsa.pub", destination: "/home/vagrant/ansible/master_id_rsa.pub"
    node1.vm.provision "shell", path: "add_master_key_to_node_authorized_keys.sh"
    node1.vm.provision "shell", path: "configure_sshd.sh"
  end

end

