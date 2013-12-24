json.set! :diets do
  json.array!(@diets) do |diet|
    json.extract! diet, :id, :title, :start_date, :goal
    json.supplement_ids diet.supplements.collect(&:id)
  end
end
json.set! :supplements do
  json.array! (@diets.collect(&:supplements).flatten) do |supplement|
    json.extract! supplement, :id, :title, :image_url
    json.nutritional_item_ids supplement.nutritional_items.collect(&:id)
    json.diet_id supplement.diet.id
  end
end