class AddColumnChoiseCategoryCategoryalls < ActiveRecord::Migration
  def up
    add_column :categoryalls, :choise_category, :integer, :default => 0, :null => false  
  end
end
