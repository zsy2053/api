class ChangeModelRelationships < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :user_id
    add_column :bookings, :renter_id, :integer
    add_column :bookings, :leaser_id, :integer
    add_column :sales, :renter_id, :integer
    add_column :sales, :leaser_id, :integer
  end
end
