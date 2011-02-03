class AddAncestryToLeaves < ActiveRecord::Migration
  def self.up
    add_column :leaves, :ancestry, :string
    add_index :leaves, :ancestry
  end

  def self.down
    remove_column :leaves, :ancestry
    add_index :leaves, :ancestry
  end
end
