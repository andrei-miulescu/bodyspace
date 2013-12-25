class Timeline < ActiveRecord::Base
  include ActionView::Helpers::AssetTagHelper
  belongs_to :user
  has_many :posts, dependent: :destroy

  validates_presence_of :headline, :text, :caption

  scope :valid_timelines, includes(:posts).where('headline is NOT NULL')

  def hero_image
    return asset_url('assets/no_image.png')    unless posts.last
    posts.last.image(:high)
  end

end
