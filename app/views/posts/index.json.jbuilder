json.array!(@posts) do |post|
  json.extract! post, :id, :headline
  json.image post.image.url(:high)
end
