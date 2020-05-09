# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"
  config.vm.synced_folder ".", "/Vagrant", type: "smb"
  config.vm.provision :shell, path: "docker-provision.sh"

  config.vm.provider "hyperv" do |h|
    h.linked_clone = true
    h.cpus = 3
    h.memory = 4096
  end

end