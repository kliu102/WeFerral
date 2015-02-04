class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :consumer_id, null: false
      t.integer :campaign_pledge_id, null: true
      t.float :amount, null: false
      t.uuid :uuid, null: false

      t.timestamps null: false
    end

    add_index :transactions, :uuid, unique: true
  end

  def self.down
    drop_table :transactions
  end
end
