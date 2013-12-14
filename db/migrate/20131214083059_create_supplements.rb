class CreateSupplements < ActiveRecord::Migration
  def change
    create_table :supplements do |t|
      t.integer :diet_id
      t.string :title
      t.string :image_url
      t.integer :rating
      t.string :supported_goal
      t.string :main_ingredient
      t.string :url

      t.timestamps
    end
  end
end
