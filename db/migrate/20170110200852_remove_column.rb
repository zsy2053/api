class RemoveColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :sale_id
  end
end
