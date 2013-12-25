json.set! :workouts do
  json.array!(@workouts) do |workout|
    json.extract! workout, :id, :name, :goal, :start_date
  end
end
