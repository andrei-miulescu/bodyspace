json.set! :diets do
  json.array!(@diets) do |diet|
    json.extract! diet, :id, :title, :start_date, :goal
    json.supplement_count diet.supplements.count
    json.supplement_ids diet.supplements.collect(&:id)
  end
end
json.set! :supplements do
  @diets.each do |diet|
    json.array! (diet.supplements) do |supplement|
      json.extract! supplement, :id, :title, :image_url
    end
  end
end