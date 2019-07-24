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

ActiveRecord::Schema.define(version: 20190725181019) do

  create_table "announcements", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coop_id"
    t.index ["coop_id"], name: "index_announcements_on_coop_id"
    t.index ["user_id", "created_at"], name: "index_announcements_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "coops", force: :cascade do |t|
    t.string "name"
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.text "shift"
    t.text "message"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_events_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "menus", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "starch"
    t.text "protein"
    t.text "vegetable"
    t.text "restrictions"
    t.text "notes"
    t.integer "coop_id"
    t.index ["coop_id"], name: "index_menus_on_coop_id"
    t.index ["user_id", "created_at"], name: "index_menus_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_menus_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.integer "coop_id"
    t.index ["coop_id"], name: "index_users_on_coop_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
