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

desc 'Packages the Vagrant box'
task :package do
  system 'vagrant package --output bitnami-wordpress-' +
    BITNAMI_WORDPRESS_VERSION + '.box'
end

task default: [:rubocop]
