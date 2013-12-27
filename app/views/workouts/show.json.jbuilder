json.set! :workout do
  json.extract! @workout, :id, :name, :goal, :start_date
  json.exercise_ids @workout.exercises.collect(&:id)
end
json.set! :exercises do
  json.array!(@workout.exercises) do |exercise|
    json.extract! exercise, :id, :name, :rating, :exercise_photos, :guide_instructions, :guide_image, :info_table, :workout_id
  end
end