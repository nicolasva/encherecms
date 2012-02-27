class RenameColumnContentsToContentInCategoryalls < ActiveRecord::Migration
  def up
    rename_column :categoryalls, :contents, :content 
  end
end
