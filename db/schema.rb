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

ActiveRecord::Schema.define(version: 20171025040301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dining_types", force: :cascade do |t|
    t.bigint "restaurant_dining_type_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_dining_type_id"], name: "index_dining_types_on_restaurant_dining_type_id"
  end

  create_table "food_types", force: :cascade do |t|
    t.bigint "restaurant_food_type_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_food_type_id"], name: "index_food_types_on_restaurant_food_type_id"
  end

  create_table "restaurant_dining_types", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.bigint "dining_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dining_type_id"], name: "index_restaurant_dining_types_on_dining_type_id"
    t.index ["restaurant_id"], name: "index_restaurant_dining_types_on_restaurant_id"
  end

  create_table "restaurant_food_types", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.bigint "food_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_type_id"], name: "index_restaurant_food_types_on_food_type_id"
    t.index ["restaurant_id"], name: "index_restaurant_food_types_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip", null: false
    t.integer "dollar_value", null: false
    t.text "description"
    t.string "picture"
    t.string "phone_number"
    t.string "website_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.string "reason_of_visit", null: false
    t.integer "quality_of_service", null: false
    t.integer "noise_level", null: false
    t.boolean "fits_taste", null: false
    t.integer "lighting", null: false
    t.integer "cleanliness", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "username", null: false
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
    t.string "avatar"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "review_id", null: false
    t.integer "value", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_votes_on_review_id"
    t.index ["user_id", "review_id"], name: "index_votes_on_user_id_and_review_id", unique: true
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

end
