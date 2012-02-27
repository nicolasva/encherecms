class CreateCategoryalls < ActiveRecord::Migration
  def change
    create_table :categoryalls do |t|
      t.string "name", :default => "Category name", :null => false
      t.integer "panel_id", :null => false
      t.boolean "link_category", :default => true
      t.string "imgcategoryall_file_name"
      t.string "imgcategoryall_content_type"
      t.string "imgcategoryall_file_size"
      t.datetime "imgcategoryall_updated_at"
      t.timestamps
    end

    add_index "categoryalls", ["panel_id"], :name => "panel_id"

    create_table "categoryalls_users", :id => false, :force => true do |t|
      t.integer "user_id", :null => false
      t.integer "categoryall_id", :null => false
    end

    add_index "categoryalls_users", ["user_id"], :name => "user_id"
    add_index "categoryalls_users", ["categoryall_id"], :name => "categoryall_id"
    
  end
end
