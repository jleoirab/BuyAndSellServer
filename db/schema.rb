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

ActiveRecord::Schema.define(version: 20150524190310) do

  create_table "ads", force: true do |t|
    t.integer  "town_id"
    t.integer  "category_id"
    t.string   "category_type"
    t.string   "creator_name"
    t.string   "creator_email"
    t.string   "creator_phone"
    t.text     "description"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.decimal  "price",         precision: 10, scale: 2
    t.string   "name"
    t.string   "address"
  end

  add_index "ads", ["category_type", "category_id"], name: "index_ads_on_category_type_and_category_id"
  add_index "ads", ["town_id"], name: "index_ads_on_town_id"

  create_table "books", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nations", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "nation_id"
  end

  add_index "states", ["nation_id"], name: "index_states_on_nation_id"

  create_table "towns", force: true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "towns", ["state_id"], name: "index_towns_on_state_id"

end
