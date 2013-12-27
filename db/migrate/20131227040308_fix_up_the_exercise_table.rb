class FixUpTheExerciseTable < ActiveRecord::Migration
  def change
    remove_column :exercises, :exercise_type
    remove_column :exercises, :main_muscle
    remove_column :exercises, :equipment
    remove_column :exercises, :mechanics_type
    remove_column :exercises, :level
    remove_column :exercises, :guide_html
    remove_column :exercises, :sequences
    remove_column :exercises, :alternate_exercises
    add_column :exercises, :info_table, :text, array: true, default: []
    add_column :exercises, :exercise_photos, :string, array: true, default: []
    add_column :exercises, :guide_instructions, :text, array: true, default: []
  end
end
