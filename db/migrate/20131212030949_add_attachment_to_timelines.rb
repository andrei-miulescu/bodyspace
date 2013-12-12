class AddAttachmentToTimelines < ActiveRecord::Migration
  def self.up
    add_attachment :timelines, :image
  end

  def self.down
    remove_attachment :timelines, :images
  end
end
