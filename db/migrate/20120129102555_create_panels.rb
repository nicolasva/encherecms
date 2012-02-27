class CreatePanels < ActiveRecord::Migration
  def change
    create_table :panels do |t|
      t.string "name", :default => "Panel name", :null => false
      t.integer "categoryall_or_content", :default => 0
      t.string "linkwebsite", :default => "http://"
      t.integer "position", :default => 0
      t.boolean "onlyconnectuser", :default => false
      t.timestamps
    end
  end
end
