json.set! :exercise do
  json.extract! @exercise, :id, :name, :rating, :exercise_photos, :guide_instructions, :guide_image, :info_table, :workout_id
end