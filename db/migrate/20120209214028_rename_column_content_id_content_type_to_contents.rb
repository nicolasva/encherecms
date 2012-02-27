class RenameColumnContentIdContentTypeToContents < ActiveRecord::Migration
  def up
    rename_column(:contents, :content_id, :contains_id)
    rename_column(:contents, :content_type, :contains_type) 
  end
end
