class AddTextToNameColumnIngredients < ActiveRecord::Migration
  def change
    change_column :ingredients, :name, :text
  end
end
