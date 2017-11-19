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

ActiveRecord::Schema.define(version: 20171116160754) do

  create_table "asks", force: :cascade do |t|
    t.integer  "college_id"
    t.integer  "major_id"
    t.string   "content"
    t.integer  "user_id"
    t.integer  "univ_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "asks", ["univ_id"], name: "index_asks_on_univ_id"
  add_index "asks", ["user_id"], name: "index_asks_on_user_id"

  create_table "boards", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "group_code"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "boards", ["user_id"], name: "index_boards_on_user_id"

  create_table "cards", force: :cascade do |t|
    t.string   "card_company"
    t.string   "card_number"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "cards", ["user_id"], name: "index_cards_on_user_id"

  create_table "colleges", force: :cascade do |t|
    t.string   "college_name"
    t.integer  "univ_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "colleges", ["univ_id"], name: "index_colleges_on_univ_id"

  create_table "majors", force: :cascade do |t|
    t.string   "major_name"
    t.integer  "college_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "majors", ["college_id"], name: "index_majors_on_college_id"

  create_table "receipts", force: :cascade do |t|
    t.string   "categroy"
    t.datetime "pay_date"
    t.integer  "amount"
    t.string   "content"
    t.text     "detail_content"
    t.text     "extra"
    t.string   "bill"
    t.integer  "user_id"
    t.integer  "card_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "receipts", ["card_id"], name: "index_receipts_on_card_id"
  add_index "receipts", ["user_id"], name: "index_receipts_on_user_id"

  create_table "replies", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "replies", ["board_id"], name: "index_replies_on_board_id"
  add_index "replies", ["user_id"], name: "index_replies_on_user_id"

  create_table "univs", force: :cascade do |t|
    t.string   "univ_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.integer  "univ_id"
    t.integer  "college_id"
    t.integer  "major_id"
    t.string   "phone_number"
    t.string   "univ_alarm"
    t.string   "college_alarm"
    t.string   "major_alarm"
    t.string   "user_role"
    t.string   "active"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
