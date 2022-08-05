require 'active_record'
require 'sqlite3'
require 'pry'

namespace :db do
  DATABASE_ENV = ENV['DATABASE_ENV'] || 'development'
  MIGRATIONS_DIR = ENV['MIGRATIONS_DIR'] || 'db/migrate'

  db_config = YAML.load(File.open('config/database.yml'))

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
    puts 'DB successfully deleted'
  end

  desc 'create a db/schema.rb file'
  task :add_schema do
    require 'active_record/schema_dumper'
    filename = 'db/schema.rb'
    File.open(filename, 'w:utf-8') do |file|
      ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
    end
    puts 'Schema file Created'
  end

  desc 'Migrate the database'
  task :run_migrations do
    ActiveRecord::MigrationContext.new("db/migrate/").migrate
    Rake::Task['db:schema'].invoke
    puts 'DB migrated successfully'
  end

  task schema: %i[connect add_schema]
  task migrate: %i[connect run_migrations]
end

namespace :g do
  desc 'Generate Migration'
  task :migration do
    name = ARGV[1] || raise('Specify name: rake g:migration <migration>')
    timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    path = File.expand_path("../db/migrate/#{timestamp}_#{name}.rb", __FILE__)
    migration_class = name.split('_').map(&:capitalize).join

    File.open(path, 'w') do |file|
      file.write <<~EOF
        class #{migration_class} < ActiveRecord::Migration[7.0]
          def self.up
          end
          def self.down
          end
        end
      EOF
    end

    puts "Migration #{path} created"
    abort
  end
end
