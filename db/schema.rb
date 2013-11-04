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

ActiveRecord::Schema.define(version: 20131104011051) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id", "created_at"], name: "index_articles_on_user_id_and_created_at"

  create_table "downloadable_files", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "display_name"
    t.integer  "access_id"
    t.string   "the_file_file_name"
    t.string   "the_file_content_type"
    t.integer  "the_file_file_size"
    t.datetime "the_file_updated_at"
  end

  create_table "file_bundles", force: true do |t|
    t.integer  "file_id"
    t.integer  "file_access_id"
    t.boolean  "public",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "file_permissions", force: true do |t|
    t.integer  "file_bundle_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
