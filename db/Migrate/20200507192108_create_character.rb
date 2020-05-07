class CreateCharacter < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :gender_id
      t.integer :house_id
      t.integer :ancestry_id
      t.string :actor
    end
  end
end