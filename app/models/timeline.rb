class Timeline < ActiveRecord::Base
  self.inheritance_column = :_type_disabled

  has_attached_file :image

  Paperclip.interpolates :image_extension do |a, s|
    a.instance.image_extension
  end

  process_in_background :image

  belongs_to :user
  has_many :posts, dependent: :destroy

  validates_presence_of :headline, :text, :caption , :type, :image

  def media_hash
    default_values = as_json.symbolize_keys.slice(:headline, :text, :type)
    asset =  {
        media: image.url(:high),
        thumbnail: image.url(:thumb),
        caption: caption
    }
    default_values[:asset] = asset
    default_values[:date] = posts_hash
    { timeline: default_values }
  end

  def asset
    {
        media: image.url(:high),
        thumbnail: image.url(:thumb),
        caption: caption
    }
  end

  def posts_hash
    posts.map(&:media_hash)
  end
end
