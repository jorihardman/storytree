class ChangeLeavesToBranches < ActiveRecord::Migration
  def self.up
    drop_table :leaves
    create_table "branches", :force => true do |t|
      t.text     "leaf_text"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "ancestry"
      t.integer  "points",     :default => 0
      t.string   "type"
      t.integer  "user_id",                   :null => false
      t.integer  "forest_id",                 :null => false
      t.string   "title"
    end
  end

  def self.down
    drop_table :branches
    create_table "leaves", :force => true do |t|
      t.text     "leaf_text"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "ancestry"
      t.integer  "points",     :default => 0
      t.string   "type"
      t.integer  "user_id",                   :null => false
      t.integer  "forest_id",                 :null => false
      t.string   "title"
    end
  end
end
