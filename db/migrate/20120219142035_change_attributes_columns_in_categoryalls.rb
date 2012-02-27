class ChangeAttributesColumnsInCategoryalls < ActiveRecord::Migration
  def up
    change_column(:categoryalls, :name, :string, :default => "Category name", :null => true)
  end
end
