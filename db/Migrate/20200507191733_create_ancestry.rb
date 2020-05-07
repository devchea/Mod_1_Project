class CreateAncestry < ActiveRecord::Migration[5.2]
  def change
    create_table :ancestries do |t|
      t.string :kind
    end
  end
end
