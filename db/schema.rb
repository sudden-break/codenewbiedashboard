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

ActiveRecord::Schema.define(version: 20141013065113) do

  create_table "answers", force: true do |t|
    t.datetime "date"
    t.string   "topic"
    t.string   "flag"
    t.string   "tweet_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
    t.string   "author"
    t.string   "author_img"
  end

  add_index "answers", ["tweet_id"], name: "index_answers_on_tweet_id", unique: true

  create_table "questions", force: true do |t|
    t.datetime "date"
    t.string   "topic"
    t.string   "flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tweet_id"
  end

  add_index "questions", ["tweet_id"], name: "index_questions_on_tweet_id", unique: true

end
