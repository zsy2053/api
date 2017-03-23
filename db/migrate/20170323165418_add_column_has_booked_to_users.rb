class AddColumnHasBookedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :has_booked, :boolean, default: false
  end
end
