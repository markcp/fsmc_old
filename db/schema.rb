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

ActiveRecord::Schema.define(:version => 20121216061747) do

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.integer  "year_id"
    t.string   "director_display"
    t.string   "screenwriter_display"
    t.string   "title_sort"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "movies", ["title", "year_id"], :name => "index_movies_on_title_and_year_id"

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "performances", :force => true do |t|
    t.integer  "person_id"
    t.integer  "movie_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",                  :default => false
    t.string   "remember_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "years", :force => true do |t|
    t.string   "name"
    t.datetime "start_voting_at"
    t.datetime "end_voting_at"
    t.datetime "start_results_display_at"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

end
