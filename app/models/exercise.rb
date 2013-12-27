class Exercise < ActiveRecord::Base
  belongs_to :workout
  belongs_to :user

  validates_presence_of :name, :exercise_photos, :info_table, :guide_instructions
  validates_uniqueness_of :name, :scope => :workout
end
