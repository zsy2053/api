class Addprices < ActiveRecord::Migration[5.0]
  def change
    rename_column :cars, :price, :weekday_price
    add_column :cars, :weekend_price, :integer
  end
end
