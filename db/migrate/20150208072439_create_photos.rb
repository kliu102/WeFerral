class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :image
      t.belongs_to :campaign_pledge, index:true
      t.boolean :is_master, default: false

      t.timestamps null: false
    end
  end
end
