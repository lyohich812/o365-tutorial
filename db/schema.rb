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

ActiveRecord::Schema.define(version: 2019_09_27_150156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", id: false, force: :cascade do |t|
    t.string "id"
    t.datetime "created_date_time"
    t.datetime "last_modified_date_time"
    t.string "change_key"
    t.string "categories"
    t.string "original_start_time_zone"
    t.string "original_end_time_zone"
    t.string "response_status"
    t.string "i_cal_u_id"
    t.integer "reminder_minutes_before_start"
    t.boolean "is_reminder_on"
    t.boolean "has_attachments"
    t.string "subject"
    t.string "body"
    t.string "body_preview"
    t.string "importance"
    t.string "sensitivity"
    t.string "start"
    t.string "end"
    t.string "location"
    t.boolean "is_all_day"
    t.boolean "is_cancelled"
    t.boolean "is_organizer"
    t.string "recurrence"
    t.boolean "response_requested"
    t.string "series_master_id"
    t.string "show_as"
    t.string "type"
    t.string "attendees"
    t.string "organizer"
    t.string "web_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

end
