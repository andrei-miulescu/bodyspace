class Post < ActiveRecord::Base

  has_attached_file :image, :styles => { :high => "600x600>", :thumb => "100x100>" }

  belongs_to :timeline
  belongs_to :user

  validates_presence_of :headline, :text, :caption , :start_date, :end_date, :timeline, :image

end
