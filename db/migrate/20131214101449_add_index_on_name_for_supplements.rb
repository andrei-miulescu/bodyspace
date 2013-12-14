class AddIndexOnNameForSupplements < ActiveRecord::Migration
  def change
    add_index :supplements, :title
  end
end
