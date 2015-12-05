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

ActiveRecord::Schema.define(version: 20151205020057) do

  create_table "adminusers", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "contact"
    t.string   "password"
    t.string   "passwordconfirmation"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "applicants", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "contact"
    t.decimal  "gpa"
    t.integer  "credit_hours"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.date     "date_of_birth"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "applications", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "applicant_id"
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string   "school_name"
    t.string   "string"
    t.string   "address"
    t.string   "years_attended"
    t.boolean  "graduated"
    t.string   "degree_received"
    t.integer  "applicant_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "allDay"
    t.string   "user_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiences", force: :cascade do |t|
    t.string   "employer"
    t.string   "supervisor"
    t.string   "supervisor_phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "start_salary"
    t.integer  "end_salary"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "position"
    t.text     "duties"
    t.text     "reason_leaving"
    t.integer  "applicant_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "internship_applications", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "applicant_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "application_id"
    t.text     "answer1"
    t.text     "answer2"
    t.text     "answer3"
    t.text     "answer4"
  end

  create_table "interviewrecords", force: :cascade do |t|
    t.string   "AdminEmails"
    t.text     "InterviewStartTime"
    t.text     "InterviewEndTime"
    t.text     "InterviewDate"
    t.string   "SentReminderEmails"
    t.integer  "ApplicantId"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "qualifications"
    t.date     "postedon"
    t.date     "deadline"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "adminuser_id"
    t.string   "jobtype"
  end

  create_table "questions", force: :cascade do |t|
    t.text     "question"
    t.string   "job_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "job_id"
  end

  create_table "references", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "occupation"
    t.string   "years_known"
    t.integer  "applicant_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "contact"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
