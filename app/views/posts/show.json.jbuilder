json.set! :post do
  json.extract! @post, :id, :headline, :text
  json.image @post.image.url(:high)
  json.timeline_id @post.timeline.id
end