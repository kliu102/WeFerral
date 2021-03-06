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

ActiveRecord::Schema.define(version: 20150224051955) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.integer  "addressable_id",   limit: 4
    t.string   "addressable_type", limit: 255
    t.string   "address1",         limit: 255, null: false
    t.string   "address2",         limit: 255
    t.string   "city",             limit: 255, null: false
    t.string   "postal_code",      limit: 255, null: false
    t.string   "phone_number",     limit: 255
    t.integer  "state_id",         limit: 4,   null: false
    t.integer  "country_id",       limit: 4,   null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree
  add_index "addresses", ["city"], name: "index_addresses_on_city", using: :btree
  add_index "addresses", ["country_id"], name: "index_addresses_on_country_id", using: :btree
  add_index "addresses", ["phone_number"], name: "index_addresses_on_phone_number", using: :btree
  add_index "addresses", ["postal_code"], name: "index_addresses_on_postal_code", using: :btree
  add_index "addresses", ["state_id"], name: "index_addresses_on_state_id", using: :btree

  create_table "campaign_pledges", force: :cascade do |t|
    t.uuid     "uuid",            limit: 16,                         null: false
    t.float    "total_budget",    limit: 24,                         null: false
    t.float    "unit_budget",     limit: 24,                         null: false
    t.integer  "campaign_id",     limit: 4
    t.string   "status",          limit: 255,   default: "inactive", null: false
    t.string   "title",           limit: 255
    t.text     "description",     limit: 65535
    t.boolean  "is_master",       limit: 1,     default: false
    t.integer  "referrals_count", limit: 4,     default: 0,          null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "campaign_pledges", ["campaign_id"], name: "index_campaign_pledges_on_campaign_id", using: :btree
  add_index "campaign_pledges", ["status"], name: "index_campaign_pledges_on_status", using: :btree
  add_index "campaign_pledges", ["uuid"], name: "index_campaign_pledges_on_uuid", unique: true, using: :btree

  create_table "campaigns", force: :cascade do |t|
    t.uuid     "uuid",              limit: 16,                         null: false
    t.integer  "merchant_user_id",  limit: 4
    t.datetime "start_at",                                             null: false
    t.datetime "expired_at",                                           null: false
    t.string   "permalink",         limit: 255,                        null: false
    t.string   "status",            limit: 255,   default: "inactive", null: false
    t.string   "title",             limit: 255
    t.text     "description",       limit: 65535
    t.integer  "referrals_count",   limit: 4,     default: 0,          null: false
    t.integer  "impressions_count", limit: 4,     default: 0,          null: false
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "campaigns", ["merchant_user_id"], name: "index_campaigns_on_merchant_user_id", using: :btree
  add_index "campaigns", ["status"], name: "index_campaigns_on_status", using: :btree
  add_index "campaigns", ["uuid"], name: "index_campaigns_on_uuid", unique: true, using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name",            limit: 255,                 null: false
    t.string   "iso_name",        limit: 255,                 null: false
    t.string   "iso",             limit: 255,                 null: false
    t.string   "iso3",            limit: 255,                 null: false
    t.integer  "numcode",         limit: 4,                   null: false
    t.boolean  "states_required", limit: 1,   default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "countries", ["iso"], name: "index_countries_on_iso", using: :btree
  add_index "countries", ["iso3"], name: "index_countries_on_iso3", using: :btree
  add_index "countries", ["iso_name"], name: "index_countries_on_iso_name", using: :btree
  add_index "countries", ["name"], name: "index_countries_on_name", using: :btree
  add_index "countries", ["numcode"], name: "index_countries_on_numcode", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "campaign_id",        limit: 4
    t.boolean  "is_master",          limit: 1,   default: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "images", ["campaign_id"], name: "index_images_on_campaign_id", using: :btree

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type", limit: 255
    t.integer  "impressionable_id",   limit: 4
    t.integer  "user_id",             limit: 4
    t.string   "controller_name",     limit: 255
    t.string   "action_name",         limit: 255
    t.string   "view_name",           limit: 255
    t.string   "request_hash",        limit: 255
    t.string   "ip_address",          limit: 255
    t.string   "session_hash",        limit: 255
    t.text     "message",             limit: 65535
    t.text     "referrer",            limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", length: {"impressionable_type"=>nil, "message"=>255, "impressionable_id"=>nil}, using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "merchant_users", force: :cascade do |t|
    t.string   "name",                   limit: 255,                 null: false
    t.uuid     "uuid",                   limit: 16,                  null: false
    t.boolean  "admin",                  limit: 1,   default: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "merchant_users", ["email"], name: "index_merchant_users_on_email", unique: true, using: :btree
  add_index "merchant_users", ["reset_password_token"], name: "index_merchant_users_on_reset_password_token", unique: true, using: :btree
  add_index "merchant_users", ["uuid"], name: "index_merchant_users_on_uuid", unique: true, using: :btree

  create_table "referrals", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "parent_id",         limit: 4
    t.uuid     "uuid",              limit: 16,              null: false
    t.string   "status",            limit: 255,             null: false
    t.string   "reason",            limit: 255
    t.integer  "referable_id",      limit: 4
    t.string   "referable_type",    limit: 255
    t.string   "relative_url",      limit: 255,             null: false
    t.integer  "referrals_count",   limit: 4,   default: 0, null: false
    t.integer  "impressions_count", limit: 4,   default: 0, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "referrals", ["parent_id"], name: "index_referrals_on_parent_id", using: :btree
  add_index "referrals", ["referable_type", "referable_id"], name: "index_referrals_on_referable_type_and_referable_id", using: :btree
  add_index "referrals", ["user_id"], name: "index_referrals_on_user_id", using: :btree
  add_index "referrals", ["uuid"], name: "index_referrals_on_uuid", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "abbr",       limit: 255, null: false
    t.integer  "country_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "states", ["abbr"], name: "index_states_on_abbr", using: :btree
  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree
  add_index "states", ["name"], name: "index_states_on_name", using: :btree

  create_table "taxonomies", force: :cascade do |t|
    t.string   "name",       limit: 255,             null: false
    t.integer  "level",      limit: 4,   default: 0, null: false
    t.integer  "parent_id",  limit: 4
    t.uuid     "uuid",       limit: 16,              null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "taxonomies", ["level"], name: "index_taxonomies_on_level", using: :btree
  add_index "taxonomies", ["name"], name: "index_taxonomies_on_name", using: :btree
  add_index "taxonomies", ["parent_id"], name: "index_taxonomies_on_parent_id", using: :btree
  add_index "taxonomies", ["uuid"], name: "index_taxonomies_on_uuid", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.integer  "campaign_pledge_id", limit: 4
    t.float    "amount",             limit: 24, null: false
    t.uuid     "uuid",               limit: 16, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "transactions", ["campaign_pledge_id"], name: "index_transactions_on_campaign_pledge_id", using: :btree
  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id", using: :btree
  add_index "transactions", ["uuid"], name: "index_transactions_on_uuid", unique: true, using: :btree

  create_table "user_actions", force: :cascade do |t|
    t.uuid     "uuid",               limit: 16, null: false
    t.integer  "user_id",            limit: 4
    t.integer  "campaign_pledge_id", limit: 4,  null: false
    t.integer  "referral_id",        limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "user_actions", ["campaign_pledge_id"], name: "index_user_actions_on_campaign_pledge_id", using: :btree
  add_index "user_actions", ["referral_id"], name: "index_user_actions_on_referral_id", using: :btree
  add_index "user_actions", ["user_id"], name: "index_user_actions_on_user_id", using: :btree
  add_index "user_actions", ["uuid"], name: "index_user_actions_on_uuid", using: :btree

  create_table "users", force: :cascade do |t|
    t.uuid     "uuid",                   limit: 16,                null: false
    t.float    "balance",                limit: 24,  default: 0.0, null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "email",                  limit: 255, default: "",  null: false
    t.string   "encrypted_password",     limit: 255, default: "",  null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uuid"], name: "index_users_on_uuid", unique: true, using: :btree

end
