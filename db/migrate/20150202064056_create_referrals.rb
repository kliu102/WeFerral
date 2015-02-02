class CreateReferrals < ActiveRecord::Migration
  def self.up
    create_table :referrals do |t|
      t.integer :consumer_id, null:false
      t.integer :campaign_pledge_id, null:false
      t.integer :parent_consumer_id, null:true
      t.uuid :uuid, null:false

      t.timestamps null: false
    end

    add_index :referrals, :uuid,                unique: true
  end

  def self.down
    drop_table :referrals
  end
end
