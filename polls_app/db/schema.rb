# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_13_212357) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answerchoices", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.text "choice", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answerchoices_on_question_id"
  end

  create_table "polls", force: :cascade do |t|
    t.bigint "poller_id", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poller_id"], name: "index_polls_on_poller_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "question", null: false
    t.bigint "poll_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poll_id"], name: "index_questions_on_poll_id"
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "responder_id", null: false
    t.bigint "response_choice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["responder_id"], name: "index_responses_on_responder_id"
    t.index ["response_choice_id"], name: "index_responses_on_response_choice_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "answerchoices", "questions"
  add_foreign_key "polls", "users", column: "poller_id"
  add_foreign_key "questions", "polls"
  add_foreign_key "responses", "answerchoices", column: "response_choice_id"
  add_foreign_key "responses", "users", column: "responder_id"
end
