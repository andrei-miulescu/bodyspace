class Post < ActiveRecord::Base

  has_attached_file :image

  process_in_background :image

  belongs_to :timeline
  belongs_to :user

  validates_presence_of :headline, :text, :caption , :start_date, :end_date, :timeline

  def media_hash
    default_values = as_json.symbolize_keys.slice(:headline, :text)
    asset =  {
            media: image.url(:high),
            thumbnail: image.url(:thumb),
            caption: caption
        }
    default_values[:startDate] = start_date.strftime('%Y,%m,%d')
    default_values[:endDate] = end_date.strftime('%Y,%m,%d')
    default_values[:asset] = asset
    default_values
  end

  def asset
    {
        media: image.url(:high),
        thumbnail: image.url(:thumb),
        caption: caption
    }
  end

end
