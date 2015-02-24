class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :name, index: true, null: false
      t.string :abbr, index: true, null: false
      t.belongs_to :country, index: true

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :states
  end
end
