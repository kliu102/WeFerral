class CreateConsumerActions < ActiveRecord::Migration
  def self.up
    create_table :consumer_actions do |t|
      t.uuid :uuid, null: false, index:true
      t.belongs_to :consumer, index: true
      t.belongs_to :campaign_pledge, index: true
      t.belongs_to :referral, index: true

      t.timestamps null: false
    end
  end

  def self.down
     drop_table :consumer_actions
  end
end
