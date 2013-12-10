class Post < ActiveRecord::Base
  belongs_to :timeline
  belongs_to :user

end
