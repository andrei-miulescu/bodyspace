class NutritionalItem < ActiveRecord::Base
  belongs_to :supplement

  validates_presence_of :supplement, :ingredient_id

  def ingredient
    Ingredient.find(ingredient_id)
  end
end
