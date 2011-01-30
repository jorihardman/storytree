class CreateSeedDetails < ActiveRecord::Migration

  def self.up
    add_column :leaves, :type, :string

    create_table :seed_details do |t|
      t.integer :seed_id
      t.string  :title
      t.integer :branch_length
      t.boolean :double_posting

      t.timestamps
    end
  end

  def self.down
    drop_table :seed_details
  end
end
