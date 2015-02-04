class CreateReferrals < ActiveRecord::Migration
  def self.up
    create_table :referrals do |t|
      t.integer :consumer_id, null:false
      t.integer :campaign_pledge_id, null:true
      t.integer :campaign_id, null:false
      t.integer :parent_consumer_id, null:true
      t.uuid :uuid, null:false
      t.string :status, null:false
      t.string :reason, null:true
      t.text :qr_code, null:true

      t.timestamps null: false
    end

    add_index :referrals, :uuid, unique: true
  end

  def self.down
    drop_table :referrals
  end
end
