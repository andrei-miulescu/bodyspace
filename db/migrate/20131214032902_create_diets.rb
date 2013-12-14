class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.string :title
      t.date :start_date
      t.string :goal

      t.timestamps
    end
  end
end
