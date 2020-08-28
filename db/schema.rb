# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_28_231409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hike_lists", force: :cascade do |t|
    t.bigint "hike_id", null: false
    t.bigint "list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hike_id"], name: "index_hike_lists_on_hike_id"
    t.index ["list_id"], name: "index_hike_lists_on_list_id"
  end

  create_table "hikes", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "location"
    t.string "difficulty"
    t.string "duration"
    t.string "length"
    t.string "photo"
    t.string "directionURL"
    t.string "routeURL"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "hike_lists", "hikes"
  add_foreign_key "hike_lists", "lists"
  add_foreign_key "lists", "users"
end
