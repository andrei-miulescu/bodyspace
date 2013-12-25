class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.string :name
      t.date :start_date
      t.string :goal

      t.timestamps
    end
  end
end
