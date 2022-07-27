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

ActiveRecord::Schema[7.0].define(version: 2022_07_27_094916) do
  create_table "all_services", force: :cascade do |t|
    t.string "category"
    t.integer "category_id"
    t.string "service_id"
    t.string "service"
    t.string "migratable"
    t.integer "count"
    t.string "details"
    t.integer "digital_time"
    t.integer "branch_time"
    t.string "service_image_link"
    t.string "service_alt_text"
    t.string "cat_image_link"
    t.string "cat_alt_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "deep_link"
  end

  create_table "branches", force: :cascade do |t|
    t.string "bank"
    t.string "branch_name"
    t.string "branch"
    t.string "sms_number"
  end

  create_table "durations", force: :cascade do |t|
    t.string "branch"
    t.string "branch_id"
    t.integer "wait_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "requirements"
    t.datetime "ttc"
    t.string "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string "topic"
  end

  create_table "transactions_trackers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
