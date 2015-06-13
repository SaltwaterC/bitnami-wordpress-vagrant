#
# Cookbook Name:: bitnami-wordpress
# Recipe:: default
#

package 'htop' do
  action [:install, :upgrade]
end

# install Bitnami WordPress
unless File.directory? '/opt/bitnami'
  installer = '/tmp/bitnami-wordpress-installer.run'
  bnconfig = '/opt/bitnami/apps/wordpress/bnconfig'

  remote_file installer do
    version = node['bitnami']['wordpress']['version']
    source "https://downloads.bitnami.com/files/stacks/wordpress/#{version}/"\
      "bitnami-wordpress-#{version}-linux-x64-installer.run"
    mode '0755'
  end

  execute installer + ' --mode unattended --base_password bitnami '\
    '--baseinstalltype production --prefix /opt/bitnami'
  execute bnconfig + ' --appurl /'

  file installer do
    action :delete
  end

  link '/etc/init.d/bitnami' do
    to '/opt/bitnami/ctlscript.sh'
  end

  execute 'update-rc.d bitnami defaults'
end

cookbook_file 'usr.local.bin.purge' do
  path '/usr/local/bin/purge'
  mode '0755'
end

cookbook_file 'etc.profile.d.bitnami.sh' do
  path '/etc/profile.d/bitnami.sh'
  mode '0644'
end
