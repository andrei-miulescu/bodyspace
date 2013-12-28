json.set! :workouts do
  json.array!(@workouts) do |workout|
    json.extract! workout, :id, :name, :goal, :start_date
    json.exercise_ids workout.exercises.collect(&:id)
  end
end
json.set! :exercises do
  json.array!(@workouts.collect(&:exercises).flatten) do |exercise|
    json.extract! exercise, :id, :name, :rating, :exercise_photos, :guide_instructions, :guide_image, :info_table, :workout_id
  end
end
