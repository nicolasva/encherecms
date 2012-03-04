class CreateTitleproducts < ActiveRecord::Migration
  def change
    create_table :titleproducts do |t|
      t.string "title", :null => false, :default => "title comentable products"
      t.text "detail", :null => true, :default => " " 
      t.integer "product_id", :null => false
      t.timestamps
    end

    add_index "titleproducts", ["product_id"], :name => "product_id"
  end
end
