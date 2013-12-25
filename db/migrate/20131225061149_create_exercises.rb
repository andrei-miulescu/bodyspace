class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :workout_id
      t.integer :user_id
      t.string :name
      t.string :exercise_type
      t.string :main_muscle
      t.string :equipment
      t.string :mechanics_type
      t.string :level
      t.string :rating
      t.json :sequences
      t.text :guide_html
      t.string :guide_image
      t.json :alternate_exercises

      t.timestamps
    end
  end
end
