json.array!(@timelines) do |timeline|
  json.extract! timeline, :id, :headline, :text, :media, :thumbnail, :caption
  json.url timeline_url(timeline, format: :json)
end
