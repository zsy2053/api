class CreateBuildings < ActiveRecord::Migration[5.0]
  def change
    create_table :buildings do |t|
      t.string :address
      t.integer :phone_number
      t.string :city
      t.string :postal_code
      t.string :province
      t.integer :num_units

      t.timestamps
    end
  end
end
