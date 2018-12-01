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

ActiveRecord::Schema.define(version: 2018_12_01_104425) do

  create_table "people", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "person_id"
    t.float "avg_time_spent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_room_visits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "room_id"
    t.integer "in_time"
    t.integer "out_time"
    t.integer "time_spent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_person_room_visits_on_person_id"
    t.index ["room_id"], name: "index_person_room_visits_on_room_id"
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "room_no"
    t.float "avg_time_spent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_persons_visited"
  end

  add_foreign_key "person_room_visits", "people"
  add_foreign_key "person_room_visits", "rooms"
end
