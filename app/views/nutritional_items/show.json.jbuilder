json.set! :nutritional_item do
  json.extract! @nutritional_item, :id, :rdi, :quantity
  json.name  @nutritional_item.ingredient.name
end
