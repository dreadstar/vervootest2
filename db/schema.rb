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

ActiveRecord::Schema.define(version: 20150626155354) do

  create_table "action_scavengers", force: :cascade do |t|
    t.boolean  "team",           limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "start_msg",      limit: 65535
    t.text     "complete_msg",   limit: 65535
    t.boolean  "seqreveal_flag", limit: 1
  end

  create_table "action_simpleshares", force: :cascade do |t|
    t.text     "display_msg",         limit: 65535
    t.string   "network_filter_list", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "action_stubs", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.text     "description",         limit: 65535
    t.boolean  "enabled",             limit: 1
    t.integer  "challenge_id",        limit: 4
    t.decimal  "amt",                               precision: 10
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "as_action_stub_id",   limit: 4
    t.string   "as_action_stub_type", limit: 255
  end

  create_table "challenge_memberships", force: :cascade do |t|
    t.integer  "challenge_id", limit: 4
    t.integer  "user_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenges", force: :cascade do |t|
    t.string   "name",                       limit: 255
    t.text     "description",                limit: 65535
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal  "total_offer",                              precision: 10
    t.decimal  "amount_raised",                            precision: 10
    t.text     "sponsor_blurb",              limit: 65535
    t.text     "charity_blurb",              limit: 65535
    t.boolean  "enabled",                    limit: 1
    t.string   "seo_name",                   limit: 255
    t.string   "img_thumb_url",              limit: 255
    t.string   "logo_url",                   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id",                   limit: 4
    t.string   "challenge_img_file_name",    limit: 255
    t.string   "challenge_img_content_type", limit: 255
    t.integer  "challenge_img_file_size",    limit: 4
    t.datetime "challenge_img_updated_at"
    t.string   "img_thumb_url_file_name",    limit: 255
    t.string   "img_thumb_url_content_type", limit: 255
    t.integer  "img_thumb_url_file_size",    limit: 4
    t.datetime "img_thumb_url_updated_at"
  end

  create_table "challenges_nonprofits", force: :cascade do |t|
    t.integer "challenge_id", limit: 4
    t.integer "nonprofit_id", limit: 4
  end

  create_table "challenges_sponsors", force: :cascade do |t|
    t.integer "challenge_id", limit: 4
    t.integer "sponsor_id",   limit: 4
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "nonprofits", force: :cascade do |t|
    t.string   "email",                    limit: 255
    t.boolean  "enabled",                  limit: 1
    t.string   "name",                     limit: 255
    t.string   "address1",                 limit: 255
    t.string   "address2",                 limit: 255
    t.string   "city",                     limit: 255
    t.string   "state",                    limit: 255
    t.string   "province",                 limit: 255
    t.string   "postal_code",              limit: 255
    t.string   "country",                  limit: 255
    t.string   "phone_number",             limit: 255
    t.string   "website",                  limit: 255
    t.string   "seo_name",                 limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img_file_name",            limit: 255
    t.string   "img_content_type",         limit: 255
    t.integer  "img_file_size",            limit: 4
    t.datetime "img_updated_at"
    t.string   "thumb_file_name",          limit: 255
    t.string   "thumb_content_type",       limit: 255
    t.integer  "thumb_file_size",          limit: 4
    t.datetime "thumb_updated_at"
    t.string   "image_full",               limit: 255
    t.string   "image_thumb",              limit: 255
    t.string   "image_full_file_name",     limit: 255
    t.string   "image_full_content_type",  limit: 255
    t.integer  "image_full_file_size",     limit: 4
    t.datetime "image_full_updated_at"
    t.string   "image_thumb_file_name",    limit: 255
    t.string   "image_thumb_content_type", limit: 255
    t.integer  "image_thumb_file_size",    limit: 4
    t.datetime "image_thumb_updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scavenger_items", force: :cascade do |t|
    t.integer  "action_scavenger_id", limit: 4
    t.text     "hint_msg",            limit: 65535
    t.text     "found_msg",           limit: 65535
    t.decimal  "order",                             precision: 10
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "find_amt",                          precision: 10
    t.boolean  "prereq_flag",         limit: 1
    t.string   "name",                limit: 255
    t.string   "public_id",           limit: 255
  end

  create_table "scavenger_items_prereqs", force: :cascade do |t|
    t.integer "scavenger_item_id", limit: 4
    t.integer "prereq_id",         limit: 4
  end

  add_index "scavenger_items_prereqs", ["scavenger_item_id", "prereq_id"], name: "index_scavenger_items_prereqs_on_scavenger_item_id_and_prereq_id", using: :btree

  create_table "sponsors", force: :cascade do |t|
    t.string   "email",                    limit: 255
    t.boolean  "enabled",                  limit: 1
    t.string   "name",                     limit: 255
    t.string   "address1",                 limit: 255
    t.string   "address2",                 limit: 255
    t.string   "city",                     limit: 255
    t.string   "state",                    limit: 255
    t.string   "province",                 limit: 255
    t.string   "postal_code",              limit: 255
    t.string   "country",                  limit: 255
    t.string   "phone_number",             limit: 255
    t.string   "website",                  limit: 255
    t.string   "seo_name",                 limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img_file_name",            limit: 255
    t.string   "img_content_type",         limit: 255
    t.integer  "img_file_size",            limit: 4
    t.datetime "img_updated_at"
    t.string   "thumb_file_name",          limit: 255
    t.string   "thumb_content_type",       limit: 255
    t.integer  "thumb_file_size",          limit: 4
    t.datetime "thumb_updated_at"
    t.string   "image_full",               limit: 255
    t.string   "image_thumb",              limit: 255
    t.string   "image_full_file_name",     limit: 255
    t.string   "image_full_content_type",  limit: 255
    t.integer  "image_full_file_size",     limit: 4
    t.datetime "image_full_updated_at"
    t.string   "image_thumb_file_name",    limit: 255
    t.string   "image_thumb_content_type", limit: 255
    t.integer  "image_thumb_file_size",    limit: 4
    t.datetime "image_thumb_updated_at"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_first",             limit: 255
    t.string   "name_last",              limit: 255
    t.string   "name_middle",            limit: 255
    t.string   "username",               limit: 255
    t.datetime "dob_date"
    t.string   "address1",               limit: 255
    t.string   "address2",               limit: 255
    t.string   "city",                   limit: 255
    t.string   "state",                  limit: 255
    t.string   "province",               limit: 255
    t.string   "postal_code",            limit: 255
    t.string   "country",                limit: 255
    t.string   "gender",                 limit: 255
    t.string   "phone",                  limit: 255
    t.string   "img_url",                limit: 255
    t.string   "fax",                    limit: 255
    t.string   "role_type",              limit: 255
    t.integer  "id_organization",        limit: 4
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
