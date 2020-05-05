class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :species
      t.string :gender
      t.string :house
      t.string :ancestry
      t.string :actor
    end
  end
end
