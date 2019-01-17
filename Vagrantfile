# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Specify the base box
  config.vm.box = "ubuntu/xenial64"   # ubuntu 16.04 LTS 64-bit
  config.disksize.size = '20GB'

  # copy current directory to vagrant machine
  config.vm.synced_folder ".", "/home/vagrant/autolabjs", type: "rsync"

  # VM specific configs
  config.vm.provider "virtualbox" do |v|
    v.gui = false
    v.name = "AutolabJS-Enodes"
    v.memory = 4096
    v.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
  echo "cd /home/vagrant/autolabjs" >>  /home/ubuntu/.bashrc
  SHELL

  # install autolab
  config.vm.provision :shell, privileged: true, path: "deploy/dev_setup/vagrant.sh"
end
