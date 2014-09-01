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

ActiveRecord::Schema.define(version: 20140901203009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_core_values", force: true do |t|
    t.integer "core_value_id"
    t.integer "action_id"
  end

  create_table "actions", force: true do |t|
    t.boolean "value"
    t.string  "grouping"
    t.string  "name"
  end

  create_table "core_values", force: true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "courses", force: true do |t|
    t.integer  "teacher_id"
    t.string   "subject"
    t.integer  "period_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollments", force: true do |t|
    t.integer  "student_id"
    t.integer  "period_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guardians", force: true do |t|
    t.string   "username",                    null: false
    t.string   "password_digest",             null: false
    t.string   "first_name",                  null: false
    t.string   "last_name",                   null: false
    t.string   "email"
    t.integer  "login_counter",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guardianships", force: true do |t|
    t.integer  "student_id"
    t.integer  "guardian_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periods", force: true do |t|
    t.string "name"
  end

  create_table "scholar_hours", force: true do |t|
    t.integer "student_id"
    t.string  "reason"
    t.string  "description"
    t.date    "date_assigned"
    t.date    "date_served"
  end

  create_table "student_actions", force: true do |t|
    t.integer  "enrollment_id"
    t.integer  "action_id"
    t.text     "comment"
    t.date     "date"
    t.integer  "scholar_hour_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "username",                    null: false
    t.string   "password_digest",             null: false
    t.string   "first_name",                  null: false
    t.string   "last_name",                   null: false
    t.string   "email"
    t.string   "id_num",                      null: false
    t.date     "dob",                         null: false
    t.integer  "grade",                       null: false
    t.string   "gender",                      null: false
    t.integer  "login_counter",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.string   "username",                        null: false
    t.string   "password_digest",                 null: false
    t.string   "first_name",                      null: false
    t.string   "last_name",                       null: false
    t.string   "email",                           null: false
    t.string   "title",                           null: false
    t.boolean  "is_admin",        default: false
    t.integer  "login_counter",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
