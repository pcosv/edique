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

ActiveRecord::Schema.define(version: 20170613002004) do

  create_table "participations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_participations_on_project_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "participations_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_participations_users_on_task_id"
    t.index ["user_id"], name: "index_participations_users_on_user_id"
  end

  create_table "post_attachments", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.date     "start_date"
    t.date     "final_date"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "finished",    default: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.date     "final_date"
    t.string   "task_report"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "project_id"
    t.boolean  "completed",   default: false
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "cpf"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "admin",           default: false
  end

end
