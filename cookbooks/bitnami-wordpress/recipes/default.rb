#
# Cookbook Name:: bitnami-wordpress
# Recipe:: default
#

package 'htop'

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
execute bnconfig + ' --disable_banner 1'

file installer do
  action :delete
end
