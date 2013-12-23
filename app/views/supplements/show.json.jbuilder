json.set! :supplement do
  json.extract! @supplement, :id, :title, :image_url, :url, :diet_id
  json.nutritional_item_ids @supplement.nutritional_items.collect(&:id)
end
json.set! nutritional_items do
  json.array! @supplement.nutritional_items do |ni|
    json.extract! :id, :quantity, :rdi
    json.name ni.ingredient.name
  end
end