class ChangeSupplentsRating < ActiveRecord::Migration
  def change
    change_column :supplements, :rating, :decimal
  end
end
