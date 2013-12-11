json.array!(@timelines) do |timeline|
  json.extract! timeline, :id, :text
  json.url timeline_url(timeline, format: :json)
end
