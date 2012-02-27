class CreateContents < ActiveRecord::Migration
  def change
    create_table "contents", :force => true do |t|
      t.text "content_text", :default => "Content", :null => false
      t.integer "panel_id"
      t.boolean "border", :default => false
      t.boolean "overflow", :default => false
      t.string "backgroundcolor", :default => "inherit"
      t.string "bordercolor", :default => "black"
      t.integer "categoryall_id", :null => false
    end

    add_index "contents", ["categoryall_id"], :name => "contents_on_categoryall_id"
    add_index "contents", ["panel_id"], :name => "contents_on_panel_id"
  end
end
