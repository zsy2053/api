class AddPowerToTools < ActiveRecord::Migration[5.0]
  def change
    add_column :tools, :power, :string
  end
end
