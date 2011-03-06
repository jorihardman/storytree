class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
      t.integer :branch_id
      t.integer :user_id
      t.integer :forest_id
      t.integer :points, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :publications
  end
end
