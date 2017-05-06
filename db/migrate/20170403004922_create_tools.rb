class CreateTools < ActiveRecord::Migration[5.0]
  def change
    create_table :tools do |t|
      t.string :tool_type
      t.string :category
      t.integer :price
      t.string :brand
      t.text :description
      t.string :condition
      t.string :location
      t.integer :user_id
      t.timestamps
    end
  end
end
