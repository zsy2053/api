class CreateToolPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :tool_photos do |t|

      t.timestamps
    end
  end
end
