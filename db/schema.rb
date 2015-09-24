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

ActiveRecord::Schema.define(version: 20150923015036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gelatos", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "dairy",       default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.boolean  "slices"
    t.integer  "seating_capacity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "menu_pizzas", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.decimal  "small_price",  precision: 4, scale: 2
    t.decimal  "medium_price", precision: 4, scale: 2
    t.decimal  "large_price",  precision: 4, scale: 2
    t.boolean  "seasonal",                             default: false
    t.boolean  "active",                               default: false
  end

  create_table "pizza_toppings", force: :cascade do |t|
    t.integer  "menu_pizza_id"
    t.integer  "topping_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "pizza_toppings", ["menu_pizza_id"], name: "index_pizza_toppings_on_menu_pizza_id", using: :btree
  add_index "pizza_toppings", ["topping_id"], name: "index_pizza_toppings_on_topping_id", using: :btree

  create_table "salads", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.decimal  "small_price",  precision: 4, scale: 2
    t.decimal  "medium_price", precision: 4, scale: 2
    t.decimal  "large_price",  precision: 4, scale: 2
    t.string   "description"
  end

  create_table "toppings", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "meat"
    t.boolean  "veggie"
    t.boolean  "cheese"
    t.boolean  "seasonal",   default: false
    t.boolean  "active",     default: false
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
