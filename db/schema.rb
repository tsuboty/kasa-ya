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

ActiveRecord::Schema.define(version: 20150202103336) do

  create_table "ratings", force: true do |t|
    t.integer  "user_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "tickets", force: true do |t|
    t.integer  "user_id"
    t.integer  "umbrella_id"
    t.float    "gps_present_lat"
    t.float    "gps_present_lon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["umbrella_id"], name: "index_tickets_on_umbrella_id"
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "umbrellas", force: true do |t|
    t.float    "gps_lat"
    t.float    "gps_lon"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.float    "total_ratign"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
