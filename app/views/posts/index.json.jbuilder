json.array!(@posts) do |post|
  json.extract! post, :id, :headline, :text, :media, :thumbnail, :caption
  json.url post_url(post, format: :json)
end
