class RemoveMediaAndThumbnailFromTimelines < ActiveRecord::Migration
  def change
    remove_column :timelines, :media
    remove_column :timelines, :thumbnail
  end
end
