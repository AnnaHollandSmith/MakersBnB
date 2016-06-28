require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc "Non Destructive Upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'auto-upgrade complete'
  end

  desc 'Destructive Upgrade'
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'auto-migrate complete'
  end
end