class CreateTaxonomies < ActiveRecord::Migration
    def change
        create_table :taxonomies do |t|
            t.string :name, null: false, index: true, unique: true
            t.integer :level, null: false, default: 0, index: true
            t.references :parent, null: true, index: true
            t.uuid :uuid, null: false, index: true, unique: true

            t.timestamps null: false
        end
    end
end
