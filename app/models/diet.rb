class Diet < ActiveRecord::Base
  belongs_to :user
  has_many :supplements
  validates_presence_of :title, :goal, :start_date, :user
end
