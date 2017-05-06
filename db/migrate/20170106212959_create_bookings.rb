class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :start_date
      t.string :end_date
      t.integer :car_id
      t.integer :sale_id
      t.integer :user_id
      t.integer :tool_id
      t.timestamps
    end
  end
end
