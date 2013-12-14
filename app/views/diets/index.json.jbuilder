json.array!(@diets) do |diet|
  json.extract! diet, :id, :title, :start_date, :goal
  json.url diet_url(diet, format: :json)
end
