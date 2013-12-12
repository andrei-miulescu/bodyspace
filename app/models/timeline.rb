class Timeline < ActiveRecord::Base
  self.inheritance_column = :_type_disabled

  has_attached_file :image, :styles => { :high => "600x600>", :thumb => "100x100>" }

  belongs_to :user
  has_many :posts, dependent: :destroy

  validates_presence_of :headline, :text, :caption , :type, :image
end
