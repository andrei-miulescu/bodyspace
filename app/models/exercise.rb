class Exercise < ActiveRecord::Base
  belongs_to :workout
  belongs_to :user

  validates_presence_of :name
end
