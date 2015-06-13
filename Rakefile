require_relative 'version'

begin
  # Rubocop stuff
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError
  STDERR.puts 'Rubocop, or one of its dependencies, is not available.'
end

desc 'Runs "vagrant up"'
task :up do
  system 'vagrant up'
end

desc 'Runs "vagrant destroy"'
task :clean do
  system 'vagrant destroy -f'
end

desc 'Runs "vagrant ssh"'
task :ssh do
  system 'vagrant ssh'
end

desc 'Recreates the machine from scratch and drops to a shell'
task redo: [:clean, :up, :ssh]

desc 'Runs "vagrant reload"'
task :reload do
  system 'rm .vagrant/machines/default/virtualbox/synced_folders'
  system 'vagrant reload --provision'
end

desc 'Runs "vagrant provision"'
task :provision do
  system 'vagrant provision'
end

desc 'Purges the Vagrant box'
task :purge do
  system 'vagrant ssh -c "sudo purge"'
end

desc 'Packages the Vagrant box'
task :package do
  system 'vagrant package --output bitnami-wordpress-' +
    BITNAMI_WORDPRESS_VERSION + '.box'
end

task default: [:rubocop]

desc 'Does a Bitnami WordPress Vagrant box release'
task release: [:up, :purge, :package]
