class DropImageExtensionColumns < ActiveRecord::Migration
  def change
    remove_column :timelines, :image_extension
    remove_column :posts, :image_extension
  end
end
