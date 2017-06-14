class ChangeToolPhootName < ActiveRecord::Migration[5.0]
  def change
    rename_column :tool_photos, :image, :url
  end
end
