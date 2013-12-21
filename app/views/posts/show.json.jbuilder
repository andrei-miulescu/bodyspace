json.set! :post do
  json.extract! @post, :id, :headline, :text
  json.image @post.image.url(:high)
end