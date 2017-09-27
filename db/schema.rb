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

ActiveRecord::Schema.define(version: 20170927073450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_brands_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "bin", null: false
    t.string "phone", limit: 20, null: false
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "load_events", force: :cascade do |t|
    t.bigint "company_id"
    t.datetime "loading"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_load_events_on_company_id"
  end

  create_table "price_lists", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "price_type_id"
    t.bigint "product_id"
    t.bigint "load_event_id"
    t.decimal "price", precision: 17, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_price_lists_on_company_id"
    t.index ["load_event_id"], name: "index_price_lists_on_load_event_id"
    t.index ["price_type_id"], name: "index_price_lists_on_price_type_id"
    t.index ["product_id"], name: "index_price_lists_on_product_id"
  end

  create_table "price_types", force: :cascade do |t|
    t.string "accounting_system_code", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_price_types_on_company_id"
  end

  create_table "product_groups", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "product_type_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_product_groups_on_company_id"
    t.index ["product_type_id"], name: "index_product_groups_on_product_type_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_product_types_on_company_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "accounting_system_code", null: false
    t.string "title", null: false
    t.string "barcode", null: false
    t.bigint "product_type_id"
    t.bigint "product_group_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brand_id"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["company_id"], name: "index_products_on_company_id"
    t.index ["product_group_id"], name: "index_products_on_product_group_id"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
  end

  create_table "remainders", force: :cascade do |t|
    t.decimal "remainder", precision: 17, scale: 2
    t.bigint "company_id"
    t.bigint "load_event_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_remainders_on_company_id"
    t.index ["load_event_id"], name: "index_remainders_on_load_event_id"
    t.index ["product_id"], name: "index_remainders_on_product_id"
  end

  create_table "sales_agents", force: :cascade do |t|
    t.string "accounting_system_code", null: false
    t.string "IMEI", null: false
    t.string "name", null: false
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_sales_agents_on_company_id"
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
    t.string "accounting_system_code", null: false
    t.string "title", null: false
    t.string "address"
    t.decimal "latitude", precision: 10, scale: 4
    t.decimal "longitude", precision: 10, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.bigint "price_type_id"
    t.index ["company_id"], name: "index_shops_on_company_id"
    t.index ["price_type_id"], name: "index_shops_on_price_type_id"
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
    t.string "office"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
