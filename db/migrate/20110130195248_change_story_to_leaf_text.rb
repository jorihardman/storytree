class ChangeStoryToLeafText < ActiveRecord::Migration
  def self.up
    rename_column :leaves, :story, :leaf_text
  end

  def self.down
    rename_column :leaves, :leaf_text, :story
  end
end
