class Timeline < ActiveRecord::Base
  self.inheritance_column = :_type_disabled

  has_attached_file :image, :path => ':style/:class/:id_:filename', :styles => { :high => '600x600>', :thumb => '100x100>'},
                    :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join('config/dropbox.yml')

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

  def posts_hash
    posts.map(&:media_hash)
  end
end
