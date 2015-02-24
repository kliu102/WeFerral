class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true, index: true
      t.string :address1, null: false
      t.string :address2
      t.string :city, null: false, index: true
      t.string :postal_code, null: false, index: true
      t.string :phone_number, index: true
      t.belongs_to :state, index: true, null: false
      t.belongs_to :country, index: true, null: false

      t.timestamps null: false
    end
  end
end
