json.extract! @supplement, :id, :title, :image_url, :url, :diet_id, :created_at, :updated_at
json.nutrition_count @supplement.nutritional_items.count