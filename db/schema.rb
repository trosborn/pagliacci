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

ActiveRecord::Schema.define(version: 20160322190624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "location_id"
    t.integer  "order_id"
  end

  create_table "item_toppings", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "topping_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "description"
    t.boolean  "seasonal",     default: false
    t.boolean  "active",       default: false
    t.string   "kind"
    t.integer  "toppings_id"
    t.string   "qualifier"
    t.integer  "order_id"
    t.integer  "whole_pie_id"
    t.boolean  "side1"
  end

  add_index "items", ["toppings_id"], name: "index_items_on_toppings_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.boolean  "slices"
    t.integer  "seating_capacity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "completed",            default: false
    t.integer  "user_id"
    t.string   "special_instructions"
    t.integer  "location_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "relative_size"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "item_id"
    t.float    "half_price"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
