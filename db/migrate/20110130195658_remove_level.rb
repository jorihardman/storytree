class RemoveLevel < ActiveRecord::Migration
  def self.up
    remove_column :leaves, :level
  end

  def self.down
    add_column :leaves, :level, :integer, :default => 1
  end
end
