class CreateHouse < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.integer :character_id
      t.string :house
    end
  end
end
