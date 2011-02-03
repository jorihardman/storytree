class SetPointDefaultForUsers < ActiveRecord::Migration
  def self.up
    change_column :users, :points, :integer, :default => 0
  end

  def self.down
    change_column :users, :points, :integer
  end
end
