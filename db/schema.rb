# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_27_115447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "purchase_items", force: :cascade do |t|
    t.bigint "purchase_id"
    t.bigint "ticket_id"
    t.integer "quantity"
    t.decimal "unit_price", precision: 8, scale: 2, default: "0.0"
    t.decimal "total", precision: 8, scale: 2, default: "0.0"
    t.decimal "cashback", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["purchase_id"], name: "index_purchase_items_on_purchase_id"
    t.index ["ticket_id"], name: "index_purchase_items_on_ticket_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "tourist_id"
    t.integer "payment_type", default: 0
    t.decimal "total_price", precision: 8, scale: 2, default: "0.0"
    t.decimal "cashback_received", precision: 8, scale: 2, default: "0.0"
    t.decimal "cashback_spent", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tourist_id"], name: "index_purchases_on_tourist_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "supplier_id"
    t.string "place_name"
    t.decimal "price", precision: 8, scale: 2, default: "0.0"
    t.integer "cashback", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["supplier_id"], name: "index_tickets_on_supplier_id"
  end

  create_table "tourists", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.decimal "cashback", precision: 8, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.index ["email"], name: "index_tourists_on_email", unique: true
  end

end
