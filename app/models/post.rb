class Post < ActiveRecord::Base
  belongs_to :timeline
  belongs_to :user

  validates_presence_of :headline, :text, :media, :caption, :thumbnail , :start_date, :end_date, :timeline

end
