json.set! :posts do
  json.array!(@posts) do |post|
    json.extract! post, :id, :headline, :caption, :start_date, :end_date
    json.image post.image.url(:high)
    json.thumb post.image.url(:thumb)
    json.timeline_id post.timeline.id
  end
end
