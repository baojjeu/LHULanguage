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

ActiveRecord::Schema.define(version: 20141118164224) do

  create_table "demand_languages", force: true do |t|
    t.integer  "demand_id"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "demand_languages", ["demand_id"], name: "index_demand_languages_on_demand_id"
  add_index "demand_languages", ["language_id"], name: "index_demand_languages_on_language_id"

  create_table "demand_times", force: true do |t|
    t.integer  "demand_id"
    t.integer  "week_time_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "demand_times", ["demand_id"], name: "index_demand_times_on_demand_id"
  add_index "demand_times", ["week_time_id"], name: "index_demand_times_on_week_time_id"

  create_table "demand_users", force: true do |t|
    t.integer  "demand_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "info"
  end

  add_index "demand_users", ["demand_id"], name: "index_demand_users_on_demand_id"
  add_index "demand_users", ["user_id"], name: "index_demand_users_on_user_id"

  create_table "demands", force: true do |t|
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "language_id"
    t.integer  "instructor_id"
  end

  add_index "demands", ["language_id"], name: "index_demands_on_language_id"
  add_index "demands", ["user_id"], name: "index_demands_on_user_id"

  create_table "languages", force: true do |t|
    t.string   "name"
    t.string   "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "demand_id"
    t.integer  "applicant_id"
    t.boolean  "is_checked",   default: false
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "profile_languages", force: true do |t|
    t.integer  "profile_id"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_languages", ["language_id"], name: "index_profile_languages_on_language_id"
  add_index "profile_languages", ["profile_id"], name: "index_profile_languages_on_profile_id"

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.string   "nickname"
    t.integer  "gender",      default: 0
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "week_times", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
