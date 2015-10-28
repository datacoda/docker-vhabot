# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

# Before use, create a file .envs.yml
# account:
#   user: aoname
#   pass: 12345
#   admin: charname
#   character: botname
#   dimension: RubiKa

settings = YAML.load_file '.envs.yml'

Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider "docker" do |d|
    d.vagrant_vagrantfile = "host/Vagrantfile"
    d.build_dir = "."
    d.has_ssh = false
    d.env = {
      AO_USER: settings['account']['user'],
      AO_PASS: settings['account']['pass'],
      VHABOT_ADMIN: settings['account']['admin'],
      VHABOT_CHARACTER: settings['account']['character'],
      VHABOT_DIMENSION: settings['account']['dimension']
    }
  end
end
