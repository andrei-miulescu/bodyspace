class RemoveMediaAndThumbnailFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :media
    remove_column :posts, :thumbnail
  end
end
