
# frozen_string_literal: true
module TaskLightSetup
  def initialize_db_connection
    db_config = YAML.load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(db_config)
  end
end
