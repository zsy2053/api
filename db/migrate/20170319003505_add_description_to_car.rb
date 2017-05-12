class AddDescriptionToCar < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :description, :text
  end
end
