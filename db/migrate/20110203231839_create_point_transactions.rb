class CreatePointTransactions < ActiveRecord::Migration
  def self.up
    create_table :point_transactions do |t|
      t.integer :receiver_id
      t.string :receiver_type
      t.integer :giver_id
      t.string :giver_type
      t.integer :amount

      t.timestamps
    end
    remove_column :seed_details, :double_posting
    remove_column :seed_details, :branch_length
  end

  def self.down
    drop_table :point_transactions
    add_column :seed_details, :double_posting, :boolean
    add_column :seed_details, :branch_length, :integer
  end
end
