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

ActiveRecord::Schema[7.0].define(version: 2023_12_07_131109) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gadgets", force: :cascade do |t|
    t.string "name", null: false
    t.string "brand"
    t.integer "price"
    t.string "image_url"
    t.integer "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_gadgets", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "gadget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gadget_id"], name: "index_post_gadgets_on_gadget_id"
    t.index ["post_id"], name: "index_post_gadgets_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.string "x_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "post_gadgets", "gadgets"
  add_foreign_key "post_gadgets", "posts"
  add_foreign_key "posts", "users"
end
