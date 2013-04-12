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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130130010109) do

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.string   "year"
    t.string   "skandies_year"
    t.string   "director"
    t.string   "title_sort"
    t.boolean  "short"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "movies", ["title", "year", "skandies_year", "director"], :name => "index_movies_on_title_and_year_and_skandies_year_and_director"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "viewings", :force => true do |t|
    t.integer  "movie_id"
    t.date     "date"
    t.integer  "format_id"
    t.string   "grade"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
