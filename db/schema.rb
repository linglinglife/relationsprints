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

ActiveRecord::Schema.define(version: 20180308043756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.integer "sentiment"
    t.text "incident"
    t.text "feeling"
    t.text "expectation"
    t.integer "importance"
    t.integer "user_id"
    t.integer "sprint_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "shared"
    t.boolean "resolved"
  end

  create_table "comments", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.integer "card_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sprints", force: :cascade do |t|
    t.boolean "status"
    t.date "start"
    t.date "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "workspace_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.text "todo"
    t.integer "user_id"
    t.integer "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "password_digest"
    t.integer "relationship_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
  end

  create_table "users_workspaces", force: :cascade do |t|
    t.integer "user_id"
    t.integer "workspace_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workspaces", force: :cascade do |t|
    t.text "name"
    t.text "access_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
