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

ActiveRecord::Schema.define(:version => 20130428075344) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "alias"
    t.integer  "parent_category_id"
    t.text     "description"
    t.string   "state",              :limit => 30
    t.integer  "position",                         :default => 10000
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  add_index "categories", ["alias"], :name => "index_categories_on_alias"
  add_index "categories", ["parent_category_id"], :name => "index_categories_on_parent_category_id"

  create_table "info_blocks", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "picture"
    t.integer  "page_id"
    t.string   "state",      :limit => 30
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "info_blocks", ["page_id"], :name => "index_info_blocks_on_page_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "alias"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pages", ["alias"], :name => "index_pages_on_alias"

  create_table "product_features", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.text     "text"
    t.integer  "position",   :default => 10000
    t.integer  "product_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "product_features", ["product_id"], :name => "index_product_features_on_product_id"

  create_table "product_pictures", :force => true do |t|
    t.string   "picture"
    t.integer  "product_id"
    t.boolean  "main"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "product_pictures", ["product_id"], :name => "index_product_pictures_on_product_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "alias"
    t.string   "articul"
    t.text     "description"
    t.text     "additional"
    t.integer  "price"
    t.integer  "action_price"
    t.datetime "action_available_till"
    t.string   "video_url"
    t.string   "state",                 :limit => 30
    t.integer  "category_id"
    t.integer  "position",                            :default => 10000
    t.integer  "count_orders"
    t.boolean  "action"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
  end

  add_index "products", ["alias"], :name => "index_products_on_alias"
  add_index "products", ["category_id"], :name => "index_products_on_category_id"

  create_table "special_offers", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "page_id"
    t.integer  "product_id"
    t.string   "state",          :limit => 30
    t.datetime "available_till"
    t.integer  "position",                     :default => 1000
    t.string   "picture"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "special_offers", ["page_id"], :name => "index_special_offers_on_page_id"
  add_index "special_offers", ["product_id"], :name => "index_special_offers_on_product_id"

end
