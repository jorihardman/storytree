class CreateSeeds < ActiveRecord::Migration
  def self.up
    create_table :seeds, :inherits => :leaf do |t|
      t.string :title
      t.integer :leaf_length
      t.integer :branch_length

      t.timestamps
    end

    add_column :leaves, :subtype, :string
  end

  def self.down
    drop_table :seeds
  end
end
