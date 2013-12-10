class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.date :start_date
      t.date :end_date
      t.string :headline
      t.text :text
      t.string :media
      t.string :thumbnail
      t.string :caption
      t.references :user
      t.references :timeline

      t.timestamps
    end

    add_index :posts, :user_id
    add_index :posts, :timeline_id
  end
end
