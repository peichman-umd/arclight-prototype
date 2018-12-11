# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "puppetlabs/centos-7.0-64-puppet"

  config.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 8983, host: 8983, host_ip: "127.0.0.1"

  config.vm.provision 'shell', path: 'vagrant_scripts/system.sh'
  config.vm.provision 'shell', path: 'vagrant_scripts/ruby.sh', privileged: false
end
