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

ActiveRecord::Schema.define(version: 20170615002900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "choice_id"
  end

  add_index "answers", ["choice_id"], name: "index_answers_on_choice_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "choices", force: :cascade do |t|
    t.string  "choices_name"
    t.integer "question_id"
  end

  add_index "choices", ["question_id"], name: "index_choices_on_question_id", using: :btree

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "form_id"
    t.text    "question_name"
  end

  add_index "questions", ["form_id"], name: "index_questions_on_form_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "age"
    t.string   "sex"
    t.string   "religion"
    t.string   "ethnicity"
    t.integer  "income"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "answers", "choices"
  add_foreign_key "answers", "users"
  add_foreign_key "choices", "questions"
  add_foreign_key "questions", "forms"
end
