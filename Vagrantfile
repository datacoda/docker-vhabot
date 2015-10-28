# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

# Before use, create a file .envs.yml
# account:
#   login: aoname
#   pass: 12345
#   admin: charname
#   vhabot: botname
#   dimension: RubiKa

settings = YAML.load_file '.envs.yml'

Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider "docker" do |d|
    d.vagrant_vagrantfile = "host/Vagrantfile"
    d.build_dir = "."
    d.has_ssh = false
    d.env = {
      LOGIN: settings['account']['login'],
      PASS: settings['account']['pass'],
      VHABOT: settings['account']['vhabot'],
      ADMIN: settings['account']['admin'],
      DIMENSION: settings['account']['dimension']
    }
  end
end
