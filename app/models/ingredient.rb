class Ingredient < ActiveRecord::Base
  belongs_to :nutritional_item
  validates_presence_of :name
end
