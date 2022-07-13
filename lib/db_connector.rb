require 'activerecord'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite"
  :database => "../db/db.sqlite3"
)
