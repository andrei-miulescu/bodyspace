json.set! :timelines do
  json.array!(@timelines) do |timeline|
    json.extract! timeline, :id, :headline, :text
    json.image timeline.image.url(:high)
    json.thumb timeline.image.url(:thumb)
    json.posts_count timeline.posts.count
    json.post_ids timeline.posts.collect(&:id)
  end
end
