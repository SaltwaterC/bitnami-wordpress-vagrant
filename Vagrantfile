# encoding: utf-8

require_relative 'version'

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = 'bitnami-wordpress'

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '1036'
  end

  config.vm.network 'forwarded_port', guest: 80, host: 8080

  config.vm.provision 'chef_zero' do |chef|
    chef.add_recipe 'bitnami-wordpress'
    chef.json = {
      'bitnami' => {
        'wordpress' => {
          'version' => BITNAMI_WORDPRESS_VERSION
        }
      }
    }
  end
end
