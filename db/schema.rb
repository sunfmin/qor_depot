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

ActiveRecord::Schema.define(:version => 20101124095430) do

  create_table "carts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",                                  :default => 1
    t.decimal  "price",      :precision => 10, :scale => 0
    t.integer  "order_id"
  end

  create_table "orders", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "pay_type",   :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.decimal  "price",              :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
  end

  create_table "qor_job_workers", :force => true do |t|
    t.string   "job_name"
    t.string   "status"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qor_media_library_assets", :force => true do |t|
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.string   "data_file_size"
    t.string   "data_updated_at"
    t.string   "data_coordinates",  :limit => 1024
    t.integer  "entry_id"
    t.string   "entry_type"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qor_minisite_records", :force => true do |t|
    t.string   "group"
    t.string   "name"
    t.string   "mount_at"
    t.string   "note"
    t.string   "embed_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qor_resources_engine_screen_options", :force => true do |t|
    t.string  "mount_at"
    t.string  "resource_name"
    t.string  "screen_option_key"
    t.integer "list_count",        :default => 25
    t.string  "list_column_names"
    t.string  "list_order_by"
  end

  create_table "translations", :force => true do |t|
    t.string   "locale",         :default => "0",   :null => false
    t.string   "key",            :default => "0",   :null => false
    t.text     "value"
    t.text     "interpolations"
    t.boolean  "is_proc",        :default => false
    t.boolean  "in_yaml",        :default => false
    t.boolean  "optional",       :default => false
    t.text     "previous_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "translations", ["locale", "key"], :name => "unique_index_on_locale_and_key", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
