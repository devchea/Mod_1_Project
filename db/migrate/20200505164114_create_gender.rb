class CreateGender < ActiveRecord::Migration[5.2]
  def change
    create_table :genders do |t|
      t.integer :character_id
      t.string :gender
    end
  end
end
