class Timeline < ActiveRecord::Base
  self.inheritance_column = :_type_disabled
  belongs_to :user
  has_many :posts, dependent: :destroy
end
