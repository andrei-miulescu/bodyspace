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

ActiveRecord::Schema.define(version: 20131217025209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diets", force: true do |t|
    t.string   "title"
    t.date     "start_date"
    t.string   "goal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "ingredients", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredients", ["name"], name: "index_ingredients_on_name", using: :btree

  create_table "nutritional_items", force: true do |t|
    t.integer  "ingredient_id"
    t.integer  "supplement_id"
    t.decimal  "quantity"
    t.string   "unit"
    t.decimal  "rdi"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nutritional_items", ["ingredient_id"], name: "index_nutritional_items_on_ingredient_id", using: :btree
  add_index "nutritional_items", ["supplement_id"], name: "index_nutritional_items_on_supplement_id", using: :btree

  create_table "posts", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "headline"
    t.text     "text"
    t.string   "caption"
    t.integer  "user_id"
    t.integer  "timeline_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "image_processing"
  end

  add_index "posts", ["timeline_id"], name: "index_posts_on_timeline_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "supplements", force: true do |t|
    t.integer  "diet_id"
    t.string   "title"
    t.string   "image_url"
    t.decimal  "rating"
    t.string   "supported_goal"
    t.string   "main_ingredient"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "serving",         default: 1
  end

  add_index "supplements", ["title"], name: "index_supplements_on_title", using: :btree

  create_table "timelines", force: true do |t|
    t.string   "headline"
    t.string   "type"
    t.text     "text"
    t.string   "caption"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "image_processing"
  end

  add_index "timelines", ["user_id"], name: "index_timelines_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
