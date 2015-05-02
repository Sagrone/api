load 'mongoid/tasks/database.rake'

namespace :db do

  desc "Drops all the collections for the database for the current API.env"
  task :drop => "mongoid:drop"

  desc "Drop all collections except the system collections"
  task :purge => "mongoid:purge"

  desc "Load the seed data from db/seeds.rb"
  task :seed => :environment do
    seed_file = File.join(API.root, "db", "seeds.rb")
    load(seed_file) if File.exist?(seed_file)
  end

  desc "Create the database, and initialize with the seed data"
  task :setup => [ "mongoid:create_indexes", "db:seed" ]

  desc "Delete data and loads the seeds"
  task :reset => [ "db:drop", "db:seed" ]

  namespace :test do
    task :prepare => "mongoid:create_indexes"
  end

  task :create_indexes => "mongoid:create_indexes"

  task :remove_indexes => "mongoid:remove_indexes"
end
