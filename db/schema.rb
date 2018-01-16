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

ActiveRecord::Schema.define(version: 20180116113523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "menus_appeared"
    t.integer "times_appeared"
    t.string "first_appeared"
    t.string "last_appeared"
    t.integer "lowest_price"
    t.integer "highest_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.integer "menu_page_id"
    t.integer "price"
    t.integer "high_price"
    t.integer "dish_id"
    t.integer "xpos"
    t.integer "ypos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_pages", force: :cascade do |t|
    t.bigint "menu_id"
    t.bigint "page_number"
    t.bigint "image_id"
    t.bigint "full_height"
    t.bigint "full_width"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.string "citext"
    t.string "sponsor"
    t.string "event"
    t.string "venue"
    t.string "place"
    t.string "physical_description"
    t.string "occasion"
    t.string "notes"
    t.string "call_number"
    t.string "keywords"
    t.string "language"
    t.date "date"
    t.string "location"
    t.string "location_type"
    t.string "currency"
    t.string "currency_symbol"
    t.string "status"
    t.integer "page_count"
    t.integer "dish_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
