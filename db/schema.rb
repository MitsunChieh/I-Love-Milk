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

ActiveRecord::Schema.define(version: 20141203081252) do

  create_table "cart_items", force: true do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "qty",        default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.integer  "amount",     default: 0, null: false
    t.integer  "qty",        default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interested_people", force: true do |t|
    t.string   "name",       default: "", null: false
    t.string   "gender",     default: "", null: false
    t.string   "email",      default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "qty",        default: 0, null: false
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.integer  "amount",     default: 0, null: false
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name",                  default: "", null: false
    t.text     "description"
    t.integer  "qty"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_url_file_name"
    t.string   "logo_url_content_type"
    t.integer  "logo_url_file_size"
    t.datetime "logo_url_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "image"
    t.string   "fb_uid"
    t.string   "fb_token"
    t.datetime "fb_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.datetime "token_expired"
  end

  add_index "users", ["fb_uid"], name: "index_users_on_fb_uid", using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree

end
