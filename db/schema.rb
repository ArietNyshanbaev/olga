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

ActiveRecord::Schema.define(version: 20150607020200) do

  create_table "comentbs", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "micropost_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "comentbs", ["micropost_id"], name: "index_comentbs_on_micropost_id"
  add_index "comentbs", ["user_id", "micropost_id", "created_at"], name: "index_comentbs_on_user_id_and_micropost_id_and_created_at"
  add_index "comentbs", ["user_id"], name: "index_comentbs_on_user_id"

  create_table "comentps", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comentps", ["picture_id"], name: "index_comentps_on_picture_id"
  add_index "comentps", ["user_id", "picture_id", "created_at"], name: "index_comentps_on_user_id_and_picture_id_and_created_at"
  add_index "comentps", ["user_id"], name: "index_comentps_on_user_id"

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "picture"
    t.string   "title"
    t.string   "description"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "pictures", force: :cascade do |t|
    t.text     "title"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "photo"
  end

  add_index "pictures", ["user_id", "created_at"], name: "index_pictures_on_user_id_and_created_at"
  add_index "pictures", ["user_id"], name: "index_pictures_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.boolean  "admin",             default: false
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "picture"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
