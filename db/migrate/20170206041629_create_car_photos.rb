class CreateCarPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :car_photos do |t|
      t.string :image
      t.timestamps
    end
  end
end
