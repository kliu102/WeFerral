class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.uuid :uuid, null:false
      t.integer :merchant_id, null: false
      t.datetime :start_at, null: false
      t.datetime :expired_at, null: false

      t.timestamps null: false
    end

    add_index :campaigns, :uuid,                unique: true
  end

  def self.down
    drop_table :campaigns
  end
end
