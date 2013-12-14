class CreateNutritionalItems < ActiveRecord::Migration
  def change
    create_table :nutritional_items do |t|
      t.integer :ingredient_id
      t.integer :supplement_id
      t.decimal :quantity
      t.string :unit
      t.decimal :rdi

      t.timestamps
    end

    add_index :nutritional_items, :ingredient_id
    add_index :nutritional_items, :supplement_id
  end
end
