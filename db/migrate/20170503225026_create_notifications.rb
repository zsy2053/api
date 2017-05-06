class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :booking_id
      t.string :sender
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
