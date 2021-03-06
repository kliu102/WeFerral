class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :image
      t.belongs_to :campaign, index: true
      t.boolean :is_master, default: false

      t.timestamps null: false
    end
  end
end
