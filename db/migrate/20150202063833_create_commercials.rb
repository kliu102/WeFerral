class CreateCommercials < ActiveRecord::Migration
  def self.up
    create_table :commercials do |t|
      t.belongs_to :campaign_pledge, index: true
      t.uuid :uuid, null: false

      t.timestamps null: false
    end

    add_index :commercials, :uuid, unique: true
  end

  def self.down
    drop_table :commercials
  end
end
