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

ActiveRecord::Schema.define(version: 2019_08_19_235814) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "announcements", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coop_id"
    t.datetime "last_comment_at"
    t.index ["coop_id"], name: "index_announcements_on_coop_id"
    t.index ["user_id", "created_at"], name: "index_announcements_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "announcement_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_comments_on_announcement_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "coops", force: :cascade do |t|
    t.string "name"
    t.integer "coop_id"
  end

  create_table "discussions", force: :cascade do |t|
    t.date "date"
    t.text "title"
    t.text "message"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coop_id"
    t.boolean "meal"
    t.index ["coop_id"], name: "index_discussions_on_coop_id"
    t.index ["user_id", "created_at"], name: "index_discussions_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_discussions_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.boolean "shift"
    t.text "message"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coop_id"
    t.boolean "meal"
    t.index ["coop_id"], name: "index_events_on_coop_id"
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
    t.boolean "meal"
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
    t.string "theme", default: "light-mode"
    t.text "bio"
    t.index ["coop_id"], name: "index_users_on_coop_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
