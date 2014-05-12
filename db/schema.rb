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

ActiveRecord::Schema.define(version: 20140512012751) do

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "comments", force: true do |t|
    t.integer "iteration_id"
    t.integer "indicator_id"
    t.text    "comment"
  end

  add_index "comments", ["indicator_id"], name: "index_comments_on_indicator_id"
  add_index "comments", ["iteration_id"], name: "index_comments_on_iteration_id"

  create_table "completed_user_votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "iteration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "indicators", force: true do |t|
    t.integer "category_id"
    t.string  "name"
    t.text    "description"
    t.string  "one_label"
    t.string  "five_label"
    t.integer "sort_order"
  end

  add_index "indicators", ["category_id"], name: "index_indicators_on_category_id"

  create_table "iterations", force: true do |t|
    t.integer "project_id"
    t.string  "name"
    t.string  "status"
    t.time    "from"
    t.time    "to"
    t.integer "sort_order"
  end

  add_index "iterations", ["project_id"], name: "index_iterations_on_project_id"

  create_table "project_indicators", force: true do |t|
    t.integer "project_id"
    t.integer "indicator_id"
  end

  add_index "project_indicators", ["indicator_id"], name: "index_project_indicators_on_indicator_id"
  add_index "project_indicators", ["project_id"], name: "index_project_indicators_on_project_id"

  create_table "projects", force: true do |t|
    t.string "name"
  end

  create_table "projects_users", id: false, force: true do |t|
    t.integer "user_id",    null: false
    t.integer "project_id", null: false
  end

  create_table "ratings", force: true do |t|
    t.integer "iteration_id"
    t.integer "indicator_id"
    t.decimal "score"
  end

  add_index "ratings", ["indicator_id"], name: "index_ratings_on_indicator_id"
  add_index "ratings", ["iteration_id"], name: "index_ratings_on_iteration_id"

  create_table "users", force: true do |t|
    t.string   "google_uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "picture_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
