class AddUserIdToLeaves < ActiveRecord::Migration
  def self.up
    add_column :leaves, :user_id, :integer, :null => false
  end

  def self.down
    remove_column :leaves, :user_id, :integer
  end
end
