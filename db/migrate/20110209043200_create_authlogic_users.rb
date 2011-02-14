class CreateAuthlogicUsers < ActiveRecord::Migration
  def self.up
    drop_table :users
    create_table "users", :force => true do |t|
      t.string   "login",                                                           :null => false
      t.string   "crypted_password",                                                :null => false
      t.string   "password_salt",                                                   :null => false
      t.string   "persistence_token",                                               :null => false
      t.integer  "login_count",       :precision => 38, :scale => 0, :default => 0, :null => false
      t.datetime "last_request_at"
      t.datetime "last_login_at"
      t.datetime "current_login_at"
      t.string   "last_login_ip"
      t.string   "current_login_ip"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "email",                                                           :null => false
      t.integer  "points", :default => 0
    end

    add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
    add_index "users", ["login"], :name => "index_users_on_pen_name"
  end

  def self.down
    drop_table :users
    create_table "users", :force => true do |t|
      t.string   "fbook_id"
      t.string   "name"
      t.integer  "points",     :default => 0
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
