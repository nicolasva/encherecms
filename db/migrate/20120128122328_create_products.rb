class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string "title", :default => "Product name"
      t.float "public_price", :default => 0.0
      t.float "entry_price", :default => 0.0
      t.integer "nbr_bidder", :default => 0.0
      t.integer "nbr_sum_spot", :default => 0.0
      t.string "imgproduct_file_name"
      t.string "imgproduct_content_type"
      t.string "imgproduct_file_size"
      t.datetime "imgproduct_updated_at"
      t.integer "categoryall_id", :null => false
      t.boolean "start_inscription", :default => true
      t.boolean "start_enchere", :default => false
      t.timestamps
    end

    add_index "products", ["categoryall_id"], :name => "products_on_categoryall_id"
  end
end
