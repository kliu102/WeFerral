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

ActiveRecord::Schema.define(version: 20150208072439) do

  create_table "admins", force: :cascade do |t|
    t.uuid     "uuid",                   limit: 16,               null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  add_index "admins", ["uuid"], name: "index_admins_on_uuid", unique: true, using: :btree

  create_table "campaign_pledges", force: :cascade do |t|
    t.uuid     "uuid",        limit: 16,                         null: false
    t.datetime "start_at",                                       null: false
    t.datetime "expired_at",                                     null: false
    t.float    "total_budge", limit: 24,                         null: false
    t.float    "unit_budge",  limit: 24,                         null: false
    t.integer  "campaign_id", limit: 4
    t.string   "permalink",   limit: 255,                        null: false
    t.string   "status",      limit: 255,   default: "inactive", null: false
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.boolean  "is_master",   limit: 1,     default: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "campaign_pledges", ["campaign_id"], name: "index_campaign_pledges_on_campaign_id", using: :btree
  add_index "campaign_pledges", ["status"], name: "index_campaign_pledges_on_status", using: :btree
  add_index "campaign_pledges", ["uuid"], name: "index_campaign_pledges_on_uuid", unique: true, using: :btree

  create_table "campaigns", force: :cascade do |t|
    t.uuid     "uuid",        limit: 16,                         null: false
    t.integer  "merchant_id", limit: 4
    t.datetime "start_at",                                       null: false
    t.datetime "expired_at",                                     null: false
    t.string   "permalink",   limit: 255,                        null: false
    t.string   "status",      limit: 255,   default: "inactive", null: false
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "campaigns", ["merchant_id"], name: "index_campaigns_on_merchant_id", using: :btree
  add_index "campaigns", ["status"], name: "index_campaigns_on_status", using: :btree
  add_index "campaigns", ["uuid"], name: "index_campaigns_on_uuid", unique: true, using: :btree

  create_table "consumer_actions", force: :cascade do |t|
    t.uuid     "uuid",               limit: 16, null: false
    t.integer  "consumer_id",        limit: 4
    t.integer  "campaign_pledge_id", limit: 4,  null: false
    t.integer  "referral_id",        limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "consumer_actions", ["campaign_pledge_id"], name: "index_consumer_actions_on_campaign_pledge_id", using: :btree
  add_index "consumer_actions", ["consumer_id"], name: "index_consumer_actions_on_consumer_id", using: :btree
  add_index "consumer_actions", ["referral_id"], name: "index_consumer_actions_on_referral_id", using: :btree
  add_index "consumer_actions", ["uuid"], name: "index_consumer_actions_on_uuid", using: :btree

  create_table "consumers", force: :cascade do |t|
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

  add_index "consumers", ["email"], name: "index_consumers_on_email", unique: true, using: :btree
  add_index "consumers", ["reset_password_token"], name: "index_consumers_on_reset_password_token", unique: true, using: :btree
  add_index "consumers", ["uuid"], name: "index_consumers_on_uuid", unique: true, using: :btree

  create_table "merchants", force: :cascade do |t|
    t.string   "name",                   limit: 255,              null: false
    t.uuid     "uuid",                   limit: 16,               null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "merchants", ["email"], name: "index_merchants_on_email", unique: true, using: :btree
  add_index "merchants", ["reset_password_token"], name: "index_merchants_on_reset_password_token", unique: true, using: :btree
  add_index "merchants", ["uuid"], name: "index_merchants_on_uuid", unique: true, using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "campaign_pledge_id", limit: 4
    t.boolean  "is_master",          limit: 1,   default: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "photos", ["campaign_pledge_id"], name: "index_photos_on_campaign_pledge_id", using: :btree

  create_table "referrals", force: :cascade do |t|
    t.integer  "consumer_id",    limit: 4
    t.integer  "parent_id",      limit: 4
    t.uuid     "uuid",           limit: 16,    null: false
    t.string   "status",         limit: 255,   null: false
    t.string   "reason",         limit: 255
    t.text     "qr_code",        limit: 65535
    t.integer  "referable_id",   limit: 4
    t.string   "referable_type", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "referrals", ["consumer_id"], name: "index_referrals_on_consumer_id", using: :btree
  add_index "referrals", ["parent_id"], name: "index_referrals_on_parent_id", using: :btree
  add_index "referrals", ["referable_type", "referable_id"], name: "index_referrals_on_referable_type_and_referable_id", using: :btree
  add_index "referrals", ["uuid"], name: "index_referrals_on_uuid", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.integer  "consumer_id",        limit: 4
    t.integer  "campaign_pledge_id", limit: 4
    t.float    "amount",             limit: 24, null: false
    t.uuid     "uuid",               limit: 16, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "transactions", ["campaign_pledge_id"], name: "index_transactions_on_campaign_pledge_id", using: :btree
  add_index "transactions", ["consumer_id"], name: "index_transactions_on_consumer_id", using: :btree
  add_index "transactions", ["uuid"], name: "index_transactions_on_uuid", unique: true, using: :btree

end
