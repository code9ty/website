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

ActiveRecord::Schema.define(version: 20160814160323) do

  create_table "applicants", force: :cascade do |t|
    t.string   "first_name"
    t.string   "email"
    t.string   "github"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "status",        default: 0
    t.string   "last_name"
    t.string   "mobile_number"
  end

  create_table "assignments", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "link"
    t.datetime "due_date"
    t.datetime "start_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "bids", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "due_date"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.datetime "start_date"
    t.index ["project_id"], name: "index_bids_on_project_id"
    t.index ["user_id", "project_id"], name: "index_bids_on_user_id_and_project_id", unique: true
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "learnt"
    t.text     "problem"
    t.integer  "rating"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "suggestions"
    t.text     "possible_fix"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contributions", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "amount",     precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["user_id"], name: "index_contributions_on_user_id"
  end

  create_table "intakes", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "last_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "link"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "university"
    t.string   "year_of_study"
    t.string   "github"
    t.string   "mobile_number"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "treasurer",       default: false
    t.boolean  "admin"
  end

end
