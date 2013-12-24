json.set! :timelines do
  json.array!(@timelines) do |timeline|
    json.extract! timeline, :id, :headline, :text
    json.image timeline.image.url(:high)
    json.thumb timeline.image.url(:thumb)
    json.posts_count timeline.posts.count
    json.post_ids timeline.posts.collect(&:id)
  end
end
json.set! :posts do
  json.array! @timelines.collect(&:posts).flatten do |post|
    json.extract! post, :id, :headline, :text, :caption, :start_date, :end_date
    json.image post.image.url(:high)
    json.thumb post.image.url(:thumb)
    json.timeline_id post.timeline.id
  end
end