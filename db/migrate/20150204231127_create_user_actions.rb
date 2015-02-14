class CreateUserActions < ActiveRecord::Migration
    def self.up
        create_table :user_actions do |t|
            t.uuid :uuid, null: false, index: true, unique: true
            t.belongs_to :user, index: true
            t.belongs_to :campaign_pledge, index: true, null: false
            t.belongs_to :referral, index: true, null: true

            t.timestamps null: false
        end
    end

    def self.down
        drop_table :user_actions
    end
end
