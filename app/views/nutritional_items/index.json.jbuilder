json.set! :nutritional_items do
  json.array! @nutritional_items do |nutritional_item|
    json.extract! nutritional_item, :id, :rdi, :quantity
    json.name  nutritional_item.ingredient.name
    json.supplement_id nutritional_item.supplement.id
  end
end
