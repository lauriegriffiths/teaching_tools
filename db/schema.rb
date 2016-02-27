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

ActiveRecord::Schema.define(version: 20160226052532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_worksheets", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "article_worksheets", ["user_id"], name: "index_article_worksheets_on_user_id", using: :btree

  create_table "definition_matching_games", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "vocab_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "definition_matching_games", ["user_id"], name: "index_definition_matching_games_on_user_id", using: :btree

  create_table "definition_matching_games_words", id: false, force: :cascade do |t|
    t.integer "definition_matching_game_id"
    t.integer "word_id"
  end

  create_table "number_chases", force: :cascade do |t|
    t.string   "title"
    t.integer  "maximum"
    t.integer  "player_count"
    t.integer  "turns_per_player"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "preposition_worksheets", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "preposition_worksheets", ["user_id"], name: "index_preposition_worksheets_on_user_id", using: :btree

  create_table "types", force: :cascade do |t|
    t.string   "pos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "verb_matching_games", force: :cascade do |t|
    t.text     "verbs"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

  add_index "verb_matching_games", ["user_id"], name: "index_verb_matching_games_on_user_id", using: :btree

  create_table "vocab_worksheets", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vocab_worksheets", ["user_id"], name: "index_vocab_worksheets_on_user_id", using: :btree

  create_table "vocab_worksheets_words", id: false, force: :cascade do |t|
    t.integer "vocab_worksheet_id"
    t.integer "word_id"
  end

  create_table "words", force: :cascade do |t|
    t.string   "headword"
    t.text     "definition"
    t.integer  "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "frequency"
  end

  add_index "words", ["type_id"], name: "index_words_on_type_id", using: :btree

  add_foreign_key "article_worksheets", "users"
  add_foreign_key "definition_matching_games", "users"
  add_foreign_key "preposition_worksheets", "users"
  add_foreign_key "verb_matching_games", "users"
  add_foreign_key "vocab_worksheets", "users"
  add_foreign_key "words", "types"
end
