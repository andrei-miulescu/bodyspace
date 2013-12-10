class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.string :headline
      t.string :type
      t.text :text
      t.string :media
      t.string :thumbnail
      t.string :caption
      t.references :user

      t.timestamps
    end

    add_index :timelines, :user_id
  end
end
