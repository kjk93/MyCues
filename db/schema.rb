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

ActiveRecord::Schema.define(version: 20160317003307) do

  create_table "cues", force: :cascade do |t|
    t.decimal  "number",      precision: 7, scale: 2
    t.decimal  "time",        precision: 7, scale: 2
    t.integer  "follow"
    t.decimal  "follow_time", precision: 7, scale: 2
    t.boolean  "auto_follow"
    t.string   "purpose"
    t.string   "called"
    t.integer  "page"
    t.integer  "show_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "cues", ["number"], name: "index_cues_on_number"
  add_index "cues", ["show_id"], name: "index_cues_on_show_id"

  create_table "shows", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "shows", ["user_id", "created_at"], name: "index_shows_on_user_id_and_created_at"
  add_index "shows", ["user_id"], name: "index_shows_on_user_id"

# Could not dump table "user_settings" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "remember_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
