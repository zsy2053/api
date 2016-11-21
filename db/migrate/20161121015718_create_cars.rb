class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.integer :km
      t.string :tran
      t.string :fuel_type
      t.integer :price
      t.string :plate_num
      t.string :color
      t.integer :user_id
      t.timestamps
    end
  end
end
