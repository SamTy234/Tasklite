
require 'active_record'
require 'sqlite3'
require 'pry'

namespace :db do

  db_config = YAML::load(File.open('config/database.yml'))

  desc 'connect to the database' 
  task :connect do
    ActiveRecord::Base.establish_connection(db_config)
    puts 'DB connection successful'
  end

  desc 'create the db'
  task :create do
    touch "db/#{db_config['database']}.sqlite3"
    puts 'DB successfully created'
  end

  desc 'drop the db'
  task :drop do
    rm "db/#{db_config['database']}.sqlite3"
    puts "DB successfully deleted"
  end
  
  desc 'create a db/schema.rb file'
  task :add_schema do  
    require 'active_record/schema_dumper'
    filename = 'db/schema.rb'
    File.open(filename, "w:utf-8") do |file|
      ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
    end
    puts 'Schema file Created'
  end

  desc 'Migrate the database'

  task :run_migrations do 
    ActiveRecord::MigrationContext.new("db/migrate/").migrate
    Rake::Task["db:schema"].invoke
    puts "DB migrated successfully"
  end

  task schema: [:connect, :add_schema]
  task migrate: [:connect, :run_migrations]
end




