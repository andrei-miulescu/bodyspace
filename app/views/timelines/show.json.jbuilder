json.set! :timeline do
  json.extract! @timeline, :id, :headline, :text, :caption
  json.image @timeline.image.url(:high)
  json.thumb @timeline.image.url(:thumb)
  json.post_ids @timeline.posts.collect(&:id)
end
json.set! :posts do
  json.array! @timeline.posts do |post|
    json.extract! post, :id, :headline, :text, :caption, :start_date, :end_date
    json.image post.image.url(:high)
    json.thumb post.image.url(:thumb)
    json.timeline_id post.timeline.id
  end
end

