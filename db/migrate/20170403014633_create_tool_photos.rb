class CreateToolPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :tool_photos do |t|
      t.string :image
      t.integer :tool_id
      t.timestamps
    end
  end
end
