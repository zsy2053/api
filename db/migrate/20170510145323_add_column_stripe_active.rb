class AddColumnStripeActive < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :valid_payment, :bool, default: false
    add_column :users, :stripe_id, :integer
  end
end
