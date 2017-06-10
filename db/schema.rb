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

ActiveRecord::Schema.define(version: 20170606214705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.string   "description"
    t.string   "main_image_url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "campaign_messages", force: :cascade do |t|
    t.integer  "campaign_id"
    t.string   "order_reference"
    t.string   "author"
    t.string   "email"
    t.string   "message"
    t.boolean  "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "campaign_news", force: :cascade do |t|
    t.integer  "campaign_id"
    t.string   "text"
    t.string   "link"
    t.string   "link_text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "campaign_type"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "title"
    t.string   "subtitle"
    t.string   "video_url"
    t.string   "main_image_url"
    t.boolean  "display",        default: true
    t.string   "closing_text",   default: ""
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.integer  "campaign_id"
    t.string   "name"
    t.string   "description"
    t.string   "image_url"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.decimal  "price"
    t.integer  "target"
    t.integer  "current_amount", default: 0
  end

  create_table "orders", force: :cascade do |t|
    t.string   "reference"
    t.jsonb    "items",       default: {}, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.decimal  "price"
    t.string   "name"
    t.string   "email"
    t.integer  "campaign_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "notification_code"
    t.jsonb    "params",            default: {}, null: false
    t.jsonb    "errors",            default: {}, null: false
    t.jsonb    "transaction",       default: {}, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "avatar_url"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
