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

ActiveRecord::Schema.define(version: 20161007194530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channel_users", force: :cascade do |t|
    t.integer  "channel_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "channels", force: :cascade do |t|
    t.string   "name"
    t.string   "usernames",    default: [],              array: true
    t.string   "channel_type"
    t.string   "created_by"
    t.string   "topic"
    t.string   "purpose"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "group_id"
    t.boolean  "private"
    t.index ["group_id"], name: "index_channels_on_group_id", using: :btree
  end

  create_table "group_users", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "group_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "group_prefix"
  end

  create_table "messages", force: :cascade do |t|
    t.boolean  "beginning"
    t.text     "content"
    t.string   "sender"
    t.integer  "user_id"
    t.integer  "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint   "timestamp"
    t.integer  "group_id"
    t.index ["channel_id"], name: "index_messages_on_channel_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "token"
    t.integer  "user_id"
    t.string   "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id", using: :btree
  end

  create_table "user_channel_stars", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_group_presences", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.boolean "presence"
    t.index ["group_id"], name: "index_user_group_presences_on_group_id", using: :btree
    t.index ["user_id"], name: "index_user_group_presences_on_user_id", using: :btree
  end

  create_table "user_message_stars", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "full_name"
    t.boolean  "present"
    t.string   "icon"
    t.integer  "current_channel_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "password_digest"
    t.string   "email"
  end

  add_foreign_key "channels", "groups"
  add_foreign_key "messages", "channels"
  add_foreign_key "messages", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "user_group_presences", "groups"
  add_foreign_key "user_group_presences", "users"
end
