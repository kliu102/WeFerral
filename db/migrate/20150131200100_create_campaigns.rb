class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.uuid :uuid, null:false

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :campaigns
  end
end
