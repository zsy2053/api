class ModifyUserModel < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :password_digest, :password
    add_column :users, :password_confirmation, :string
  end
end
