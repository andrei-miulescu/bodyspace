class Supplement < ActiveRecord::Base
  has_many :nutritional_items, :dependent => :delete_all
  belongs_to :diet
  validates_presence_of :title, :image_url, :url, :diet
  validates_uniqueness_of :title
end
