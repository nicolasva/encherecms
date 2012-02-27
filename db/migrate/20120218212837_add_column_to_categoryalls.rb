class AddColumnToCategoryalls < ActiveRecord::Migration
  def change
    add_column(:categoryalls, :contents, :text, :null => true, :default => "Enter content text")
    add_column(:categoryalls, :linkwebsite, :string, :null => true, :default => "http://")
  end
end
