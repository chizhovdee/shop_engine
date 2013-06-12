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

ActiveRecord::Schema.define(:version => 20130610175652) do

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

  create_table "item_features", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "position",   :default => 10000
    t.integer  "item_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "item_features", ["item_id"], :name => "index_item_features_on_item_id"

  create_table "item_pictures", :force => true do |t|
    t.string   "picture"
    t.integer  "item_id"
    t.boolean  "main"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "item_pictures", ["item_id"], :name => "index_item_pictures_on_item_id"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "alias"
    t.string   "articul"
    t.text     "description"
    t.text     "body"
    t.text     "additional"
    t.integer  "price"
    t.datetime "action_available_till"
    t.string   "video_url"
    t.string   "state",                   :limit => 30
    t.integer  "category_id"
    t.integer  "position",                              :default => 10000
    t.integer  "count_orders"
    t.boolean  "action"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.integer  "new_price"
    t.boolean  "hit",                                   :default => false
    t.boolean  "new_item",                              :default => false
    t.boolean  "discount",                              :default => false
    t.datetime "discount_available_till"
  end

  add_index "items", ["alias"], :name => "index_items_on_alias"
  add_index "items", ["category_id"], :name => "index_items_on_category_id"

  create_table "order_calls", :force => true do |t|
    t.string   "customer_name"
    t.string   "customer_email"
    t.text     "customer_comment"
    t.string   "customer_phone"
    t.text     "service_comment"
    t.string   "state"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "item_id"
    t.string   "customer_name"
    t.string   "customer_email"
    t.text     "customer_address"
    t.text     "customer_comment"
    t.string   "customer_phone"
    t.text     "service_comment"
    t.string   "state"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "orders", ["item_id"], :name => "index_orders_on_item_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "alias"
    t.text     "body"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "position",                 :default => 1000
    t.boolean  "service",                  :default => false
    t.string   "state",      :limit => 50
  end

  add_index "pages", ["alias"], :name => "index_pages_on_alias"

  create_table "special_offers", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "page_id"
    t.integer  "item_id"
    t.string   "state",          :limit => 30
    t.datetime "available_till"
    t.integer  "position",                     :default => 1000
    t.string   "picture"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "special_offers", ["item_id"], :name => "index_special_offers_on_item_id"
  add_index "special_offers", ["page_id"], :name => "index_special_offers_on_page_id"

end
