json.set! :timeline do
  json.extract! @timeline, :id, :headline, :text, :caption
  json.image @timeline.image.url(:high)
end

