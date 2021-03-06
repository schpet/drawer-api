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

ActiveRecord::Schema.define(version: 20160228044425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "documents", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "user_id",    null: false
    t.text     "filename",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "mime_type",  null: false
    t.integer  "file_size",  null: false
    t.text     "s3_key",     null: false
    t.string   "s3_bucket",  null: false
    t.index ["user_id"], name: "index_documents_on_user_id", using: :btree
  end

  create_table "oauths", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "state",      null: false
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.text     "uid",        null: false
    t.text     "handle",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "token",      null: false
    t.index ["handle"], name: "index_users_on_handle", using: :btree
    t.index ["uid"], name: "index_users_on_uid", using: :btree
  end

  add_foreign_key "documents", "users"
end
