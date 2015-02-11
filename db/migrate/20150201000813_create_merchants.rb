class CreateMerchants < ActiveRecord::Migration
    def self.up
        create_table :merchants do |t|
            t.string :name, null: false
            t.uuid :uuid, null: false

            t.timestamps null: false
        end

        add_index :merchants, :uuid, unique: true
    end

    def self.down
        drop_table :merchants
    end
end
