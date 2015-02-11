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

ActiveRecord::Schema.define(version: 20150211215244) do

  create_table "companies", force: true do |t|
    t.string   "fantasy_name"
    t.integer  "cnpj"
    t.string   "url"
    t.string   "email"
    t.integer  "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "company_admins", force: true do |t|
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
    t.integer  "company_id"
  end

  add_index "company_admins", ["company_id"], name: "index_company_admins_on_company_id"
  add_index "company_admins", ["email"], name: "index_company_admins_on_email", unique: true
  add_index "company_admins", ["reset_password_token"], name: "index_company_admins_on_reset_password_token", unique: true

  create_table "general_admins", force: true do |t|
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
  end

  add_index "general_admins", ["email"], name: "index_general_admins_on_email", unique: true
  add_index "general_admins", ["reset_password_token"], name: "index_general_admins_on_reset_password_token", unique: true

  create_table "job_applications", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name"
    t.text     "resume"
    t.text     "jobs"
    t.text     "school"
    t.integer  "salary"
    t.integer  "job_position_id"
  end

  add_index "job_applications", ["job_position_id"], name: "index_job_applications_on_job_position_id"

  create_table "job_categories", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_positions", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "location"
    t.date     "expiration_date"
    t.string   "job_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.boolean  "featured",        default: false
    t.integer  "job_category_id"
  end

  add_index "job_positions", ["company_id"], name: "index_job_positions_on_company_id"
  add_index "job_positions", ["job_category_id"], name: "index_job_positions_on_job_category_id"

  create_table "recommendations", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "recommend"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  add_index "recommendations", ["company_id"], name: "index_recommendations_on_company_id"

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "visits", force: true do |t|
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_position_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
  end

  add_index "visits", ["job_position_id"], name: "index_visits_on_job_position_id"

end
