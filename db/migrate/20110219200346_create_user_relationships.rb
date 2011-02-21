class CreateUserRelationships < ActiveRecord::Migration
  def self.up
    create_table :user_relationships do |t|
      t.integer :follower_id
      t.integer :guide_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_relationships
  end
end
