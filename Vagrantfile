# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "vladimirutenkov/fedora-25-cloud"

    config.ssh.insert_key = false

    config.vm.synced_folder ".", "/vagrant", disabled: true

    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 1
    end

    name = "box-1"
    config.vm.define name do |machine|
        machine.vm.hostname = name

        machine.persistent_storage.enabled = true
        machine.persistent_storage.location = "./.vagrant/#{name}-store.vdi"
        machine.persistent_storage.size = 1024
        machine.persistent_storage.diskdevice = '/dev/xvdf'
    end

    config.vm.provision :ansible do |ansible|
        ansible.playbook = "provision.yml"
        ansible.groups = {
            "boxes" => [name],
        }
    end
end
