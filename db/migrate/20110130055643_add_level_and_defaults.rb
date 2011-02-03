class AddLevelAndDefaults < ActiveRecord::Migration
  def self.up
    add_column :leaves, :level, :integer, :default => 1
    change_column :leaves, :points, :integer, :default => 0
  end

  def self.down
    remove_column :leaves, :level
    change_column :leaves, :points, :integer
  end
end
