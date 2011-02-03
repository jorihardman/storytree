class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :fbook_id
      t.string :name
      t.integer :points

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
