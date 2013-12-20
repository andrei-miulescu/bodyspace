json.set! :timelines do
  json.array!(@timelines) do |timeline|
    json.extract! timeline, :id, :headline, :text
    json.image  timeline.image.url(:high)
  end
end
