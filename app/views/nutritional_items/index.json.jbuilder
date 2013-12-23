json.set! :nutritional_items do
  json.array! @nutritional_items do |nutritional_item|
    json.extract! nutritional_item, :id, :rdi, :quantity
    json.name  nutritional_item.ingredient.name
  end
end
