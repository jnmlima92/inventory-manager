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

ActiveRecord::Schema[7.0].define(version: 2022_03_07_135116) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inventories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merchandise_lots", force: :cascade do |t|
    t.string "name", null: false
    t.float "height", null: false
    t.integer "unit", null: false
    t.bigint "inventory_id"
    t.bigint "merchandise_receipt_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_id"], name: "index_merchandise_lots_on_inventory_id"
    t.index ["merchandise_receipt_id"], name: "index_merchandise_lots_on_merchandise_receipt_id"
  end

  create_table "merchandise_receipts", force: :cascade do |t|
    t.datetime "receipt_date", precision: nil
    t.float "height"
    t.integer "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "merchandise_lots", "inventories"
  add_foreign_key "merchandise_lots", "merchandise_receipts"
end
