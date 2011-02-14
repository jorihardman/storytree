class CreateForests < ActiveRecord::Migration
  def self.up
    create_table :forests do |t|
      t.string :name
      t.text :description
      t.integer :user_id

      t.timestamps
    end
    add_column :leaves, :forest_id, :integer
  end

  def self.down
    drop_table :forests
    remove_column :leaves, :forest_id, :null => false
  end
end
