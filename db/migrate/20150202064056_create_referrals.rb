class CreateReferrals < ActiveRecord::Migration
  def self.up
    create_table :referrals do |t|
      t.belongs_to :consumer, index:true
      t.references :referable, ploymorphic:true, index: true
      t.belongs_to :campaign, index:true
      t.references :parent, null:true, index: true
      t.uuid :uuid, null:false
      t.string :status, null:false
      t.string :reason, null:true
      t.text :qr_code, null:true

      t.timestamps null: false
    end

    add_index :referrals, :uuid, unique: true
  end

  def self.down
    drop_table :referrals
  end
end
