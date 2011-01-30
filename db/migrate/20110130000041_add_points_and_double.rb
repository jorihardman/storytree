class AddPointsAndDouble < ActiveRecord::Migration
  def self.up
    add_column :seeds, :double_posting, :boolean
    add_column :leaves, :points, :integer
  end

  def self.down
    remove_column :seeds, :double_posting
    remove_column :leaves, :points
  end
end
