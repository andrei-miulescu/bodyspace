json.set! :diet do
  json.extract! @diet, :id, :title, :start_date, :goal
  json.supplement_ids @diet.supplements.collect(&:id)
end
json.set! :supplements do
  json.array! (@diet.supplements) do |supplement|
    json.extract! supplement, :id, :title, :image_url, :url, :serving
    json.nutritional_item_ids supplement.nutritional_items.collect(&:id)
    json.diet_id supplement.diet_id
  end
end
json.set! :nutritional_items do
  json.array! @diet.supplements.collect(&:nutritional_items).flatten do |ni|
    json.extract! ni, :id, :rdi, :quantity
    json.name ni.ingredient.name
    json.supplement_id ni.supplement.id
  end
end
