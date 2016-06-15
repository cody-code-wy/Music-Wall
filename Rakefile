require 'rake'
require "sinatra/activerecord/rake"
require ::File.expand_path('../config/environment', __FILE__)

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc 'Start server in shotgun'
task 'server:shotgun' do
  exec 'bundle exec shotgun -p 3000 -o 0.0.0.0'
end
