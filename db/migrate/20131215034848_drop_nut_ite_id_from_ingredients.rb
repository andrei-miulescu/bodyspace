class DropNutIteIdFromIngredients < ActiveRecord::Migration
  def change
    remove_column :ingredients, :nutritional_item_id
  end
end
