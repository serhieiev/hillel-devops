# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant multi-machine & private network setup

BOX_IMAGE = "bento/ubuntu-20.04"

Vagrant.configure("2") do |config|
  config.vm.define "web" do |web|
    web.vm.box = BOX_IMAGE
    web.vm.hostname = "web.my.net"
    web.vm.network "private_network", ip: "192.168.56.12"
    web.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end
  end

  config.vm.define "wp" do |wp|
    wp.vm.box = BOX_IMAGE
    wp.vm.hostname = "wp.my.net"
    wp.vm.network "private_network", ip: "192.168.56.11"
    wp.vm.network "forwarded_port", guest: 80, host: 8080
    wp.vm.network "forwarded_port", guest: 443, host: 8443
    wp.vm.provision "shell", path: "./scripts/wp.sh"
    wp.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end
  end

  config.vm.define "db" do |db|
    db.vm.box = BOX_IMAGE
    db.vm.hostname = "db"
    db.vm.network "private_network", ip: "192.168.56.10"
    db.vm.network "forwarded_port", guest: 80, host: 3306
    db.vm.provision "shell", path: "./scripts/db.sh"
    db.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end    
  end
end