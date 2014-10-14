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

ActiveRecord::Schema.define(version: 20140904234357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actual_responses", force: true do |t|
    t.json     "responses",  default: {}, null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "completed_questionnaires", force: true do |t|
    t.integer  "user_id"
    t.integer  "questionnaire_id"
    t.json     "score",            default: {}, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", force: true do |t|
    t.integer  "relationship_id"
    t.json     "analyses",        default: {}, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groupings", force: true do |t|
    t.string "name"
  end

  create_table "invites", force: true do |t|
    t.integer  "user_id"
    t.string   "invite_token"
    t.datetime "invite_sent_at"
  end

  create_table "possible_responses", force: true do |t|
    t.string   "content"
    t.integer  "point_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "tagline"
    t.text     "description"
    t.json     "data",        default: {}, null: false
    t.json     "summary",     default: {}, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questionnaires", force: true do |t|
    t.integer  "grouping_id"
    t.string   "title"
    t.integer  "cutoff_score"
    t.integer  "ok_score"
    t.float    "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.integer  "questionnaire_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions_responses", force: true do |t|
    t.integer  "question_id"
    t.integer  "possible_response_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: true do |t|
    t.integer  "questionnaire_id"
    t.string   "quadrant_type"
    t.string   "overall"
    t.text     "content"
    t.text     "recommendation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "treatments", force: true do |t|
    t.integer  "result_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "relationship_id"
    t.boolean  "taken",           default: false, null: false
    t.string   "email"
    t.string   "phone"
    t.string   "first_name"
    t.string   "auth_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
