json.set! :supplements do
  json.array!(@supplements) do |supplement|
    json.extract! supplement, :id, :title, :image_url, :url, :diet_id
    json.nutritional_item_ids supplement.nutritional_items.collect(&:id)
  end
end
