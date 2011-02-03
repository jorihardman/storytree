class AddPointsToLeaves < ActiveRecord::Migration
  def self.up
    add_column :leaves, :points, :integer
  end

  def self.down
    remove_column :leaves, :points
  end
end
