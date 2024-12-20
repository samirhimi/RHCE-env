# -*- mode: ruby -*-
# vi:set ft=ruby sw=2 ts=2 sts=2:

NUM_MANAGED_NODE = 4
IP_NW = "172.25.250."
MANAGED_IP_START = 9

Vagrant.configure("2") do |config|
  
  config.vm.box = "generic/centos9s"
  config.vm.box_check_update = false
  config.ssh.insert_key = false

# Provision ansible control Node
    
    config.vm.define "workstation" do |control|
      control.vm.hostname = "workstation.lab.example.com"
      control.vm.network :private_network, ip: "172.25.250.9"
      control.vm.provision "shell", path: "control.sh"
      control.vm.provider "virtualbox" do |vb|
        vb.name = "workstation"
        vb.memory = "4096"
        vb.cpus = "2"
      end
end

# Provision ansible managed Nodes
  
  (1..NUM_MANAGED_NODE).each do |i|  
  config.vm.define "server#{i}" do |node|
      node.vm.network :private_network, ip: IP_NW + "#{MANAGED_IP_START + i}"
      node.vm.provision "shell", path: "managed.sh"
      node.vm.provider "virtualbox" do |vb|
        vb.name = "server#{i}"
        vb.memory = "2048"
        vb.cpus = "2"
      end                
    end
  end
end
