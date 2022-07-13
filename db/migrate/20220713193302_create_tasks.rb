class CreateTasks < ActiveRecord::Migration[7.0]
  def self.up
    create_table :tasks do |t|
      t.string :name
      t.date :starts_on
      t.date :ends_on
      t.boolean :completed
    end
  end
  def self.down
    drop_table :tasks
  end
end
