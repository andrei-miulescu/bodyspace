json.set! :timelines do
  json.array!(@timelines) do |timeline|

    json.extract! timeline, :id, :headline, :text
    json.asset timeline.asset
    json.post_ids timeline.posts.collect(&:id)

  json.set! :posts do
    json.array! timeline.posts do |post|
      json.extract! post, :id, :headline, :text
      json.startDate post.start_date.strftime('%Y,%m,%d')
      json.endDate post.end_date.strftime('%Y,%m,%d')
      json.asset post.asset
    end
  end
  end
end
