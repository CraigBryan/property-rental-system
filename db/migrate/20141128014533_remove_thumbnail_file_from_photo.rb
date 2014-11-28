class RemoveThumbnailFileFromPhoto < ActiveRecord::Migration
  def change
    remove_column :photos, :thumbnail_file, :string
  end
end
