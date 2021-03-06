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

ActiveRecord::Schema.define(version: 20140715212204) do

  create_table "notes", force: true do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id"
    t.integer "plan_id"
    t.integer "plot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["plan_id"], name: "index_notes_on_plan_id", using: :btree
  add_index "notes", ["plot_id"], name: "index_notes_on_plot_id", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "plans", force: true do |t|
    t.string "title"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plans", ["user_id"], name: "index_plans_on_user_id", using: :btree

  create_table "plots", force: true do |t|
    t.string "title"
    t.text "body"
    t.integer "parent_plot_id", default: 0, null: false
    t.integer "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plots", ["plan_id"], name: "index_plots_on_plan_id", using: :btree

  create_table "plots_users", id: false, force: true do |t|
    t.integer "plot_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
