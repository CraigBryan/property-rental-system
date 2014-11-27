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

ActiveRecord::Schema.define(version: 20141127142756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "leases", force: true do |t|
    t.date     "rental_date"
    t.time     "rental_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "download_link"
    t.integer  "property_id"
  end

  add_index "leases", ["property_id"], name: "index_leases_on_property_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.string   "credit_card_type"
    t.string   "credit_card_number"
    t.string   "credit_card_holder_name"
    t.integer  "expiry_month"
    t.integer  "expiry_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "file"
    t.string   "thumbnail_file"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "property_id"
  end

  add_index "photos", ["property_id"], name: "index_photos_on_property_id", using: :btree

  create_table "properties", force: true do |t|
    t.string   "prop_type"
    t.string   "address"
    t.string   "location"
    t.integer  "number_bathrooms"
    t.integer  "number_bedrooms"
    t.integer  "number_other_rooms"
    t.integer  "rent_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "deleted",            default: false
  end

  create_table "users", force: true do |t|
    t.string   "fName"
    t.string   "lName"
    t.string   "email"
    t.string   "typeOfAccount"
    t.integer  "maxRent"
    t.date     "creationDate"
    t.time     "creationTime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "visits", force: true do |t|
    t.date     "date"
    t.time     "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "property_id"
    t.integer  "user_id"
  end

  add_index "visits", ["property_id"], name: "index_visits_on_property_id", using: :btree
  add_index "visits", ["user_id"], name: "index_visits_on_user_id", using: :btree

end
