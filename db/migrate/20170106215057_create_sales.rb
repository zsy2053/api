class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.integer :taxes
      t.integer :price
      t.integer :deposit
      t.integer :final_payment
      t.integer :insurance_fee
      t.integer :number_nights
      t.integer :total_price
      t.integer :booking_id
      t.timestamps
    end
  end
end
