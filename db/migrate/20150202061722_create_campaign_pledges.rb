class CreateCampaignPledges < ActiveRecord::Migration
  def self.up
    create_table :campaign_pledges do |t|
      t.uuid :uuid, null:false
      t.datetime :start_at, null:false
      t.datetime :expired_at, null:false
      t.float :total_budge, null:false
      t.float :unit_budge, null:false
      t.belongs_to :campaign, index:true
      t.string :permalink, null: false, unique: true
      t.string :status, null: false, default: 'inactive', index: true
      t.string :name
      t.text :description
      t.boolean :is_master, default: false

      t.timestamps null: false
    end

    add_index :campaign_pledges, :uuid, unique: true
  end

  def self.down
    drop_table :campaign_pledges
  end
end
