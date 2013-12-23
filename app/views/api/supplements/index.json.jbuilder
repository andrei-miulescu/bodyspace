json.array!(@supplements) do |supplement|
  json.extract! supplement, :id, :title, :image_url, :url, :diet_id
  json.url supplement_url(supplement, format: :json)
end
