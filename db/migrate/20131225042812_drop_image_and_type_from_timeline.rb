class DropImageAndTypeFromTimeline < ActiveRecord::Migration
  def change
    remove_column :timelines, :type
    remove_column :timelines, :image_processing
    remove_column :timelines, :image_file_name
    remove_column :timelines, :image_content_type
    remove_column :timelines, :image_file_size
    remove_column :timelines, :image_updated_at
  end
end
