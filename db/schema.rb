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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161129040800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "regions", force: :cascade do |t|
    t.text     "name"
    t.text     "location"
    t.float    "region_lat"
    t.float    "region_long"
    t.text     "vintages"
    t.text     "region_description"
    t.text     "region_varieties"
    t.text     "region_img"
    t.text     "region_event"
    t.date     "region_event_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "travellers", force: :cascade do |t|
    t.text     "first_name"
    t.text     "last_name"
    t.string   "email"
    t.text     "image"
    t.date     "dob"
    t.text     "password_digest"
    t.boolean  "admin",           default: false
    t.string   "phone"
    t.text     "city"
    t.text     "country"
    t.float    "lat"
    t.float    "long"
    t.text     "fav_winery"
    t.text     "fav_region"
    t.text     "fav_variety"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "location"
  end

  create_table "travellers_wineries", id: false, force: :cascade do |t|
    t.integer "traveller_id"
    t.integer "winery_id"
  end

  create_table "wineries", force: :cascade do |t|
    t.text     "name"
    t.text     "winery_image"
    t.boolean  "winery_admin",       default: false
    t.boolean  "is_winery"
    t.boolean  "is_certified"
    t.text     "rating"
    t.text     "email"
    t.text     "website"
    t.float    "winery_lat"
    t.float    "winery_long"
    t.text     "feature_wine"
    t.text     "winery_description"
    t.text     "winery_pitch"
    t.text     "must_try_wines"
    t.text     "winery_event"
    t.date     "winery_event_date"
    t.boolean  "visit_app_only"
    t.boolean  "cellar_door"
    t.boolean  "restaurant"
    t.text     "rest_name"
    t.datetime "open_time_cd"
    t.datetime "close_time_cd"
    t.text     "open_days_cd"
    t.datetime "open_time_rest"
    t.datetime "close_time_rest"
    t.text     "open_days_rest"
    t.integer  "region_id"
    t.text     "winery_location"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end
