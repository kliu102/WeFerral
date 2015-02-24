class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.uuid :uuid, null: false
      t.float :balance, null: false, default: 0

      t.timestamps null: false
    end

    add_index :users, :uuid, unique: true
  end

  def self.down
    drop_table :users
  end
end
