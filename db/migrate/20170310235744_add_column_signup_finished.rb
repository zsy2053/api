class AddColumnSignupFinished < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :register_complete, :boolean
  end
end
