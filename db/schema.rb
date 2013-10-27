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

ActiveRecord::Schema.define(version: 20131024205724) do

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "comments", force: true do |t|
    t.integer "span_id"
    t.integer "indicator_id"
    t.text    "comment"
  end

  add_index "comments", ["indicator_id"], name: "index_comments_on_indicator_id", using: :btree
  add_index "comments", ["span_id"], name: "index_comments_on_span_id", using: :btree

  create_table "indicators", force: true do |t|
    t.integer "category_id"
    t.string  "name"
    t.text    "description"
    t.string  "one_label"
    t.string  "five_label"
    t.integer "sort_order"
  end

  add_index "indicators", ["category_id"], name: "index_indicators_on_category_id", using: :btree

  create_table "projects", force: true do |t|
    t.string "name"
  end

  create_table "project_indicators", force: true do |t|
    t.integer "project_id"
    t.integer "indicator_id"
  end

  create_table "ratings", force: true do |t|
    t.integer "span_id"
    t.integer "indicator_id"
    t.integer "score"
  end

  add_index "ratings", ["indicator_id"], name: "index_ratings_on_indicator_id", using: :btree
  add_index "ratings", ["span_id"], name: "index_ratings_on_span_id", using: :btree

  create_table "spans", force: true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "status"
    t.datetime "created_at", null: false
  end

  add_index "spans", ["project_id"], name: "index_spans_on_project_id", using: :btree

  add_foreign_key "comments", "indicators", name: "comments_indicator_id_fk"
  add_foreign_key "comments", "spans", name: "comments_span_id_fk"

  add_foreign_key "indicators", "categories", name: "indicators_category_id_fk"

  add_foreign_key "ratings", "indicators", name: "ratings_indicator_id_fk"
  add_foreign_key "ratings", "spans", name: "ratings_span_id_fk"

  add_foreign_key "spans", "projects", name: "spans_project_id_fk"

end
