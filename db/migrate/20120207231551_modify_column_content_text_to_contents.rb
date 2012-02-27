class ModifyColumnContentTextToContents < ActiveRecord::Migration
  def up 
    change_column(:contents, :content_text, :text, :null => true, :default => "Content")
  end
end
