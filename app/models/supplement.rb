class Supplement < ActiveRecord::Base
  has_many :nutritional_items
  belongs_to :diet
  validates_presence_of :title, :image_url, :url, :diet
end
