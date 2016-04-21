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


ActiveRecord::Schema.define(version: 20160421215952) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "pet_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorites", ["pet_id"], name: "index_favorites_on_pet_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "pets", force: :cascade do |t|
    t.integer "petfinder_id",  null: false
    t.string  "name",          null: false
    t.string  "animal",        null: false
    t.text    "description",   null: false
    t.string  "age",           null: false
    t.string  "size",          null: false
    t.string  "gender",        null: false
    t.string  "breed",         null: false
    t.string  "photos",        null: false
    t.string  "altered",       null: false
    t.string  "shots",         null: false
    t.string  "special_needs", null: false
    t.string  "contact_city",  null: false
    t.string  "contact_zip",   null: false
    t.string  "contact_state", null: false
    t.string  "contact_name",  null: false
    t.string  "contact_email", null: false
    t.string  "contact_phone", null: false
  end

  add_index "pets", ["age"], name: "index_pets_on_age", using: :btree
  add_index "pets", ["animal"], name: "index_pets_on_animal", using: :btree
  add_index "pets", ["breed"], name: "index_pets_on_breed", using: :btree
  add_index "pets", ["contact_city"], name: "index_pets_on_contact_city", using: :btree
  add_index "pets", ["contact_state"], name: "index_pets_on_contact_state", using: :btree
  add_index "pets", ["contact_zip"], name: "index_pets_on_contact_zip", using: :btree
  add_index "pets", ["gender"], name: "index_pets_on_gender", using: :btree
  add_index "pets", ["size"], name: "index_pets_on_size", using: :btree


  create_table "preferences", force: :cascade do |t|
    t.string   "animal_type"
    t.string   "size_preference"
    t.string   "age"
    t.string   "breed"
    t.string   "sex"
    t.string   "location"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "preferences", ["age"], name: "index_preferences_on_age", using: :btree
  add_index "preferences", ["animal_type"], name: "index_preferences_on_animal_type", using: :btree
  add_index "preferences", ["breed"], name: "index_preferences_on_breed", using: :btree
  add_index "preferences", ["location"], name: "index_preferences_on_location", using: :btree
  add_index "preferences", ["sex"], name: "index_preferences_on_sex", using: :btree
  add_index "preferences", ["size_preference"], name: "index_preferences_on_size_preference", using: :btree

  create_table "preferences_users", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.integer  "preference_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "preferences_users", ["preference_id"], name: "index_preferences_users_on_preference_id", using: :btree
  add_index "preferences_users", ["user_id"], name: "index_preferences_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
