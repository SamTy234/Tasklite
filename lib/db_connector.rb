require 'activerecord'

def connect_db
  ActiveRecord::Base.establish_connection(
    :adapter => "sqlite"
    :database => "../db/db.sqlite3"
  )
end
