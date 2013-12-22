json.set! :diet do
  json.extract! @diet, :id, :title, :start_date, :goal
  json.supplement_ids @diet.supplements.collect(&:id)
  json.supplement_count @diet.supplements.count
end
json.set! :supplements do
  json.array! (@diet.supplements) do |supplement|
    json.extract! supplement, :id, :title, :image_url
  end
end

