json.set! :exercises do
  json.array!(@exercises) do |exercise|
    json.extract! exercise, :id, :name, :rating, :exercise_photos, :guide_instructions, :guide_image, :info_table, :workout_id
  end
end
