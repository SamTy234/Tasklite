require 'activerecord'

ActiveRcord::Base.establish_connection(
  :adapter => "sqlite"
  :database => "../db/db.sqlite3"
)
