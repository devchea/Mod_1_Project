class CreateActor < ActiveRecord::Migration[5.2]
  def change
    create_table :actors do |t|
      t.integer :character_id
      t.string :actor
    end
  end
end
