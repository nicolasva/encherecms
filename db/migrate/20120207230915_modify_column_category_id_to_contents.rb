class ModifyColumnCategoryIdToContents < ActiveRecord::Migration
  def up
    change_column(:contents, :categoryall_id, :integer, :null => true)
  end
end
