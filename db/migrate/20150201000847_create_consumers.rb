class CreateConsumers < ActiveRecord::Migration
  def self.up
    create_table :consumers do |t|
      t.uuid :uuid, null: false
      t.float :balance, null: false, default: 0

      t.timestamps null: false
    end

    add_index :consumers, :uuid,                unique: true
  end

  def self.down
    drop_table :consumers
  end
end
