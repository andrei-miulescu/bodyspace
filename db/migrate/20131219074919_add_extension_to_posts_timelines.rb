class AddExtensionToPostsTimelines < ActiveRecord::Migration
  def change
    add_column :timelines, :image_extension, :string, :default => 'jpg'
    add_column :posts, :image_extension, :string,:default => 'jpg'
  end
end
