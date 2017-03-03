class PasswordFix < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :password, :password_digest
    remove_column :users, :password_confirmation
  end
end
