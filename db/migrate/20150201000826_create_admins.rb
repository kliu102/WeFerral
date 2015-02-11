class CreateAdmins < ActiveRecord::Migration
    def self.up
        create_table :admins do |t|
            t.uuid :uuid, null: false

            t.timestamps null: false
        end

        add_index :admins, :uuid, unique: true
    end

    def self.down
        drop_table :admins
    end
end
