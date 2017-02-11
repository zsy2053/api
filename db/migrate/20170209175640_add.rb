class Add < ActiveRecord::Migration[5.0]
  def change
    add_column :car_photos, :car_id, :integer
  end
end
