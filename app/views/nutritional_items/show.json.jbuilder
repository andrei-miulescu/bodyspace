json.set! :nutritional_item do
  json.extract! @nutritional_item, :id, :rdi, :quantity, :unit
  json.name  @nutritional_item.ingredient.name
  json.supplement_id @nutritional_item.supplement.id
end
