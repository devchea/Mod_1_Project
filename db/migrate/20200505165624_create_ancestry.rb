class CreateAncestry < ActiveRecord::Migration[5.2]
  def change
    create_table :ancestries do |t|
      t.integer :character_id
      t.string :ancestry
    end
  end
end
