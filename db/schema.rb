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

ActiveRecord::Schema.define(version: 2016_02_26_052532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_worksheets", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_article_worksheets_on_user_id"
  end

  create_table "definition_matching_games", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "vocab_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_definition_matching_games_on_user_id"
  end

  create_table "definition_matching_games_words", id: false, force: :cascade do |t|
    t.integer "definition_matching_game_id"
    t.integer "word_id"
  end

  create_table "number_chases", id: :serial, force: :cascade do |t|
    t.string "title"
    t.integer "maximum"
    t.integer "player_count"
    t.integer "turns_per_player"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preposition_worksheets", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_preposition_worksheets_on_user_id"
  end

  create_table "types", id: :serial, force: :cascade do |t|
    t.string "pos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "verb_matching_games", id: :serial, force: :cascade do |t|
    t.text "verbs"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["user_id"], name: "index_verb_matching_games_on_user_id"
  end

  create_table "vocab_worksheets_words", id: false, force: :cascade do |t|
    t.integer "vocab_worksheet_id"
    t.integer "word_id"
  end

  create_table "words", id: :serial, force: :cascade do |t|
    t.string "headword"
    t.text "definition"
    t.integer "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "frequency"
    t.index ["type_id"], name: "index_words_on_type_id"
  end

  add_foreign_key "article_worksheets", "users"
  add_foreign_key "definition_matching_games", "users"
  add_foreign_key "preposition_worksheets", "users"
  add_foreign_key "verb_matching_games", "users"
  add_foreign_key "words", "types"
end
