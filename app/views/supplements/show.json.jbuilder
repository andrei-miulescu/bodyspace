json.set! :supplement do
  json.extract! @supplement, :id, :title, :image_url, :url, :diet_id, :serving
  json.nutritional_item_ids @supplement.nutritional_items.collect(&:id)
end
json.set! :nutritional_items do
  json.array! @supplement.nutritional_items do |ni|
    json.extract! ni, :id, :quantity, :rdi, :unit
    json.name ni.ingredient.name
    json.supplement_id ni.supplement.id
  end
end