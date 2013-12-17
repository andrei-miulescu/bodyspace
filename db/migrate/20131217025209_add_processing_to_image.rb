class AddProcessingToImage < ActiveRecord::Migration
  def change
    add_column :posts, :image_processing, :boolean
    add_column :timelines, :image_processing, :boolean
  end
end
