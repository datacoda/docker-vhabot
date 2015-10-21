# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

# Copy the file vagrant.yml.template to vagrant.yml and 
# enter the local testing values.

settings = YAML.load_file 'vagrant.yml'

Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider "docker" do |d|
    d.vagrant_vagrantfile = "host/Vagrantfile"
    d.build_dir = "."
    d.has_ssh = true
    d.env = {
      AO_USER: settings['account']['user'],
      AO_PASS: settings['account']['pass'],
      VHABOT_ADMIN: settings['account']['admin'],
      VHABOT_CHARACTER: settings['account']['character'],
      VHABOT_DIMENSION: settings['account']['dimension']
    }
  end
  config.ssh.port = 22
end
