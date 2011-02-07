class RemoveSeedDetails < ActiveRecord::Migration
  def self.up
    drop_table :seed_details
    add_column :leaves, :title, :string
  end

  def self.down
    create_table :seed_details do |t|
      t.integer :seed_id
      t.string  :title

      t.timestamps
    end
    remove_column :leaves, :title
  end
end
