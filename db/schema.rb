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

ActiveRecord::Schema.define(version: 20140719001021) do

  create_table "action_scavengers", force: true do |t|
    t.boolean  "team"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "start_msg"
    t.text     "complete_msg"
  end

  create_table "action_simpleshares", force: true do |t|
    t.text     "display_msg"
    t.string   "network_filter_list"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "action_stubs", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "enabled"
    t.integer  "challenge_id"
    t.decimal  "amt",                 precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "as_action_stub_id"
    t.string   "as_action_stub_type"
  end

  create_table "challenges", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal  "total_offer",                precision: 10, scale: 0
    t.decimal  "amount_raised",              precision: 10, scale: 0
    t.text     "sponsor_blurb"
    t.text     "charity_blurb"
    t.boolean  "enabled"
    t.string   "seo_name"
    t.string   "img_thumb_url"
    t.string   "logo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.string   "challenge_img_file_name"
    t.string   "challenge_img_content_type"
    t.integer  "challenge_img_file_size"
    t.datetime "challenge_img_updated_at"
    t.string   "img_thumb_url_file_name"
    t.string   "img_thumb_url_content_type"
    t.integer  "img_thumb_url_file_size"
    t.datetime "img_thumb_url_updated_at"
  end

  create_table "challenges_nonprofits", force: true do |t|
    t.integer "challenge_id"
    t.integer "nonprofit_id"
  end

  create_table "challenges_sponsors", force: true do |t|
    t.integer "challenge_id"
    t.integer "sponsor_id"
  end

  create_table "challenges_teammembers", force: true do |t|
    t.integer "challenge_id"
    t.integer "user_id"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "nonprofits", force: true do |t|
    t.string   "email"
    t.boolean  "enabled"
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "province"
    t.string   "postal_code"
    t.string   "country"
    t.string   "phone_number"
    t.string   "website"
    t.string   "seo_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.string   "thumb_file_name"
    t.string   "thumb_content_type"
    t.integer  "thumb_file_size"
    t.datetime "thumb_updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scavenger_items", force: true do |t|
    t.integer  "action_savenger_id"
    t.text     "hint_msg"
    t.text     "found_msg"
    t.decimal  "order",              precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "find_amt",           precision: 10, scale: 0
  end

  create_table "sponsors", force: true do |t|
    t.string   "email"
    t.boolean  "enabled"
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "province"
    t.string   "postal_code"
    t.string   "country"
    t.string   "phone_number"
    t.string   "website"
    t.string   "seo_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.string   "thumb_file_name"
    t.string   "thumb_content_type"
    t.integer  "thumb_file_size"
    t.datetime "thumb_updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_first"
    t.string   "name_last"
    t.string   "name_middle"
    t.string   "username"
    t.datetime "dob_date"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "province"
    t.string   "postal_code"
    t.string   "country"
    t.string   "gender"
    t.string   "phone"
    t.string   "img_url"
    t.string   "fax"
    t.string   "role_type"
    t.integer  "id_organization"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
