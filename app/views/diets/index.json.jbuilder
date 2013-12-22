json.set! :diets do
  json.array!(@diets) do |diet|
    json.extract! diet, :id, :title, :start_date, :goal
    json.supplement_count diet.supplements.count
  end
end