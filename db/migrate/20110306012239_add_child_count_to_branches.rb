class AddChildCountToBranches < ActiveRecord::Migration
  def self.up
    add_column :branches, :child_count, :integer, :default => 0
  end

  def self.down
    remove_column :branches, :child_count
  end
end
