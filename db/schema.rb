# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120415142910) do

  create_table "categoryalls", :force => true do |t|
    t.string   "name",                        :default => "Category name"
    t.integer  "panel_id",                                                      :null => false
    t.boolean  "link_category",               :default => true
    t.string   "imgcategoryall_file_name"
    t.string   "imgcategoryall_content_type"
    t.string   "imgcategoryall_file_size"
    t.datetime "imgcategoryall_updated_at"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.text     "content",                     :default => "Enter content text"
    t.string   "linkwebsite",                 :default => "http://"
    t.integer  "choise_category",             :default => 0,                    :null => false
  end

  add_index "categoryalls", ["panel_id"], :name => "panel_id"

  create_table "categoryalls_users", :id => false, :force => true do |t|
    t.integer "user_id",        :null => false
    t.integer "categoryall_id", :null => false
  end

  add_index "categoryalls_users", ["categoryall_id"], :name => "categoryall_id"
  add_index "categoryalls_users", ["user_id"], :name => "user_id"

  create_table "contents", :force => true do |t|
    t.text    "content_text",    :default => "Content"
    t.boolean "border",          :default => false
    t.boolean "overflow",        :default => false
    t.string  "backgroundcolor", :default => "inherit"
    t.string  "bordercolor",     :default => "black"
    t.integer "contains_id"
    t.string  "contains_type"
    t.integer "bordersize",      :default => 1,         :null => false
  end

  create_table "panels", :force => true do |t|
    t.string   "name",                   :default => "Panel name", :null => false
    t.integer  "categoryall_or_content", :default => 0
    t.string   "linkwebsite",            :default => "http://"
    t.integer  "position",               :default => 0
    t.boolean  "onlyconnectuser",        :default => false
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "title",                   :default => "Product name"
    t.float    "public_price",            :default => 0.0
    t.float    "entry_price",             :default => 0.0
    t.integer  "nbr_bidder",              :default => 0
    t.integer  "nbr_sum_spot",            :default => 0
    t.string   "imgproduct_file_name"
    t.string   "imgproduct_content_type"
    t.string   "imgproduct_file_size"
    t.datetime "imgproduct_updated_at"
    t.integer  "categoryall_id",                                      :null => false
    t.boolean  "start_inscription",       :default => true
    t.boolean  "start_enchere",           :default => false
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  add_index "products", ["categoryall_id"], :name => "products_on_categoryall_id"

  create_table "titleproducts", :force => true do |t|
    t.string   "title",      :default => "title comentable products", :null => false
    t.text     "detail",     :default => " "
    t.integer  "product_id",                                          :null => false
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  add_index "titleproducts", ["product_id"], :name => "product_id"

end
