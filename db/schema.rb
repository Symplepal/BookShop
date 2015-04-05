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

ActiveRecord::Schema.define(version: 20150404105831) do

  create_table "authors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "author_id",      precision: 38, scale: 0
    t.integer  "publisher_id",   precision: 38, scale: 0
    t.datetime "published_date"
    t.integer  "price",          precision: 38, scale: 0
    t.integer  "page_count",     precision: 38, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books_genres", id: false, force: true do |t|
    t.integer  "book_id",    precision: 38, scale: 0
    t.integer  "genre_id",   precision: 38, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books_genres", ["book_id"], name: "index_books_genres_on_book_id"
  add_index "books_genres", ["genre_id"], name: "index_books_genres_on_genre_id"

  create_table "books_purchases", id: false, force: true do |t|
    t.integer  "book_id",     precision: 38, scale: 0
    t.integer  "purchase_id", precision: 38, scale: 0
    t.integer  "amount",      precision: 38, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books_purchases", ["book_id"], name: "i_books_purchases_book_id"
  add_index "books_purchases", ["purchase_id"], name: "i_books_purchases_purchase_id"

  create_table "books_stores", id: false, force: true do |t|
    t.integer  "store_id",   precision: 38, scale: 0
    t.integer  "book_id",    precision: 38, scale: 0
    t.integer  "amount",     precision: 38, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books_stores", ["book_id"], name: "index_books_stores_on_book_id"
  add_index "books_stores", ["store_id"], name: "index_books_stores_on_store_id"

  create_table "genres", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publishers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", force: true do |t|
    t.integer  "store_id",        precision: 38, scale: 0
    t.integer  "delivery_method", precision: 38, scale: 0
    t.integer  "total_cost",      precision: 38, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id",   precision: 38, scale: 0
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "i_rol_nam_res_typ_res_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "stores", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                           default: "", null: false
    t.string   "encrypted_password",                              default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          precision: 38, scale: 0, default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "i_users_reset_password_token", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id", precision: 38, scale: 0
    t.integer "role_id", precision: 38, scale: 0
  end

  add_index "users_roles", ["user_id", "role_id"], name: "i_users_roles_user_id_role_id"

end
