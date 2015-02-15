class CreateMerchantUsers < ActiveRecord::Migration
    def self.up
        create_table :merchant_users do |t|
            t.string :name, null: false
            t.uuid :uuid, null: false

            t.timestamps null: false
        end

        add_index :merchant_users, :uuid, unique: true
    end

    def self.down
        drop_table :merchant_users
    end
end
