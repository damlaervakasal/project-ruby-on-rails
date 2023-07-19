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

ActiveRecord::Schema[7.0].define(version: 2023_07_18_123639) do
  create_table "active_sessions", force: :cascade do |t|
    t.integer "useer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["useer_id"], name: "index_active_sessions_on_useer_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "category", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.date "date"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.integer "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_comments_on_card_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "active_sessions", "useers"
  add_foreign_key "comments", "cards"
end
