class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :name, index: true, null: false, unique: true
      t.string :iso_name, index: true, null: false, unique: true
      t.string :iso, index: true, null: false, unique: true
      t.string :iso3, index: true, null: false, unique: true
      t.integer :numcode, index: true, null: false, unique: true
      t.boolean :states_required, default: false

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :countries
  end
end
