class UpdateColumnToComments < ActiveRecord::Migration
  def up
    remove_column(:contents, :panel_id)
    remove_column(:contents, :categoryall_id)
    add_column(:contents, :content_id, :integer)
    add_column(:contents, :content_type, :string)
  end
end
