class CreateReferrals < ActiveRecord::Migration
  def self.up
    create_table :referrals do |t|
      t.belongs_to :users, index: true
      t.references :parent, null: true, index: true
      t.uuid :uuid, null: false, index: true, unique: true
      t.string :status, null: false
      t.string :reason, null: true
      t.references :referable, polymorphic: true, index: true
      t.string :relative_url, null: false
      t.integer :referrals_count, default: 0, null: false
      t.integer :impressions_count, default: 0, null: false

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :referrals
  end
end
