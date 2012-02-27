class AddColumnBordersizeToContents < ActiveRecord::Migration
  def change
    add_column :contents, :bordersize, :integer, :null => false, :default => 1
  end
end
