# -*- mode: ruby -*-
# vi: set ft=ruby :

# ENV["VAGRANT_EXPERIMENTAL"] = "disks"

Vagrant.configure("2") do |config|
  config.vm.box = "sugarraysam/archsugar"

  # vm
  config.vm.provider "virtualbox" do |v|
    v.name = "archsugar"
    v.gui = true
    v.memory = 4096
    v.cpus = 2
    # VBoxManage Customizations - https://www.vagrantup.com/docs/providers/virtualbox/configuration
    #v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
  end

  # disk - https://www.vagrantup.com/docs/disks/usage
  # config.vm.disk :disk, size: "2GB", primary: true

  # ssh
  config.ssh.username = "sugar"
  config.ssh.password = "sugar"
end
