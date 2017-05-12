class AddPowerToTools < ActiveRecord::Migration[5.1]
  def change
    add_column :tools, :power, :string
  end
end
