class Diet < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :goal, :start_date, :user
end
