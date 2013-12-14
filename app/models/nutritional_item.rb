class NutritionalItem < ActiveRecord::Base
  belongs_to :supplement
  has_one :ingredient
  validates_presence_of :supplement, :quantity, :unit
end
