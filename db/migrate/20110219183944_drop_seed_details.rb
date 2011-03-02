class DropSeedDetails < ActiveRecord::Migration
  def self.down
    drop_table "seed_details"
  end

  def self.up
    create_table "seed_details", :force => true do |t|
      t.integer  "seed_id"
      t.string   "title"
      t.integer  "branch_length"
      t.boolean  "double_posting"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
