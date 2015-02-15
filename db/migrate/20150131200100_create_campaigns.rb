class CreateCampaigns < ActiveRecord::Migration
    def self.up
        create_table :campaigns do |t|
            t.uuid :uuid, null: false
            t.belongs_to :merchant_user, index: true
            t.datetime :start_at, null: false
            t.datetime :expired_at, null: false
            t.string :permalink, null: false, unique: true
            t.string :status, null: false, default: 'inactive', index: true
            t.string :title
            t.text :description

            t.timestamps null: false
        end

        add_index :campaigns, :uuid, unique: true
    end

    def self.down
        drop_table :campaigns
    end
end
