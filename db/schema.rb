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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180507064524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "title", limit: 150, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.string "asc"
    t.index ["company_id"], name: "index_brands_on_company_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "asc", null: false
    t.string "title", limit: 150, null: false
    t.string "parent_code", limit: 50
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_categories_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "days", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "geodata", force: :cascade do |t|
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "time"
    t.string "sales_agent_asc"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_geodata_on_company_id"
  end

  create_table "load_events", force: :cascade do |t|
    t.bigint "company_id"
    t.datetime "loading", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_load_events_on_company_id"
  end

  create_table "order_headers", force: :cascade do |t|
    t.boolean "loaded", default: false
    t.string "current_date", null: false
    t.string "delivery_date"
    t.string "comment"
    t.decimal "sum", default: "0.0"
    t.boolean "with_docs", default: false
    t.string "wtf_code"
    t.string "imei"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "shop_asc"
    t.decimal "latitude"
    t.decimal "longitude"
    t.index ["company_id"], name: "index_order_headers_on_company_id"
  end

  create_table "order_tables", force: :cascade do |t|
    t.bigint "order_header_id"
    t.bigint "price_list_id"
    t.decimal "count", null: false
    t.decimal "cost", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_asc"
    t.index ["order_header_id"], name: "index_order_tables_on_order_header_id"
    t.index ["price_list_id"], name: "index_order_tables_on_price_list_id"
  end

  create_table "price_lists", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "load_event_id"
    t.decimal "price", precision: 17, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "price_type_asc"
    t.string "product_asc"
    t.index ["company_id"], name: "index_price_lists_on_company_id"
    t.index ["load_event_id"], name: "index_price_lists_on_load_event_id"
    t.index ["price_type_asc"], name: "index_price_lists_on_price_type_asc"
    t.index ["product_asc"], name: "index_price_lists_on_product_asc"
  end

  create_table "price_types", force: :cascade do |t|
    t.string "asc", limit: 20, null: false
    t.string "title", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_price_types_on_company_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "asc", limit: 20, null: false
    t.string "title", limit: 150, null: false
    t.string "barcode", limit: 20, null: false
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category_asc"
    t.string "brand_asc"
    t.index ["brand_asc"], name: "index_products_on_brand_asc"
    t.index ["category_asc"], name: "index_products_on_category_asc"
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  create_table "remainders", force: :cascade do |t|
    t.decimal "remainder", precision: 17, scale: 3, null: false
    t.bigint "company_id"
    t.bigint "load_event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_asc"
    t.index ["company_id"], name: "index_remainders_on_company_id"
    t.index ["load_event_id"], name: "index_remainders_on_load_event_id"
    t.index ["product_asc"], name: "index_remainders_on_product_asc"
  end

  create_table "routes", force: :cascade do |t|
    t.integer "index_number"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "shop_id"
    t.bigint "day_id"
    t.index ["company_id"], name: "index_routes_on_company_id"
    t.index ["day_id"], name: "index_routes_on_day_id"
    t.index ["shop_id"], name: "index_routes_on_shop_id"
    t.index ["user_id"], name: "index_routes_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "keywords"
    t.integer "product_type_id"
    t.integer "product_group_id"
    t.integer "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "asc", limit: 20, null: false
    t.string "title", limit: 150, null: false
    t.string "address"
    t.decimal "latitude", precision: 10, scale: 4
    t.decimal "longitude", precision: 10, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.string "price_type_asc", null: false
    t.index ["company_id"], name: "index_shops_on_company_id"
    t.index ["price_type_asc"], name: "index_shops_on_price_type_asc"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name", null: false
    t.boolean "admin", default: false
    t.string "office", default: "Не указано"
    t.bigint "company_id"
    t.boolean "sales_agent", default: false
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "routes", "days"
  add_foreign_key "routes", "shops"
  add_foreign_key "routes", "users"
end
