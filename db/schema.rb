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

ActiveRecord::Schema.define(version: 20150129213756) do

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

  create_table "job_positions", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "location"
    t.date     "expiration_date"
    t.string   "job_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  add_index "job_positions", ["company_id"], name: "index_job_positions_on_company_id"

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
