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

ActiveRecord::Schema.define(version: 2021_08_06_103243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accesses", force: :cascade do |t|
    t.bigint "incident_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["incident_id"], name: "index_accesses_on_incident_id"
    t.index ["user_id"], name: "index_accesses_on_user_id"
  end

  create_table "antagonizers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "incidents", force: :cascade do |t|
    t.datetime "date"
    t.text "description"
    t.string "media"
    t.bigint "antagonizer_id", null: false
    t.bigint "collection_id", null: false
    t.bigint "place_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["antagonizer_id"], name: "index_incidents_on_antagonizer_id"
    t.index ["collection_id"], name: "index_incidents_on_collection_id"
    t.index ["place_id"], name: "index_incidents_on_place_id"
    t.index ["user_id"], name: "index_incidents_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "address"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.bigint "incident_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["incident_id"], name: "index_tags_on_incident_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nickname"
    t.string "avatar"
    t.boolean "victim", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accesses", "incidents"
  add_foreign_key "accesses", "users"
  add_foreign_key "incidents", "antagonizers"
  add_foreign_key "incidents", "collections"
  add_foreign_key "incidents", "places"
  add_foreign_key "incidents", "users"
  add_foreign_key "tags", "incidents"
end
