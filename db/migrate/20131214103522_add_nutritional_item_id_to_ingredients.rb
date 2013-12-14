class AddNutritionalItemIdToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :nutritional_item_id, :integer
    add_index :ingredients, :nutritional_item_id
  end
end
