class AddServingToSupplement < ActiveRecord::Migration
  def change
    add_column :supplements, :serving, :integer, default: 1
  end
end
