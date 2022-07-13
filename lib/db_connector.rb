require 'activerecord'

ActiveRcord::Base.establish_connection(
  :adapter => "sqlite"
  :database => "../test.db"
)
