class CreateIdPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :id_photos do |t|
      t.integer :user_id
      t.string :image
      t.string :exp
      t.string :dob
      t.string :first_name
      t.string :last_name
      t.string :address
      t.timestamps
    end
  end
end
