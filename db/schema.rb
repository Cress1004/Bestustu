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

ActiveRecord::Schema.define(version: 2020_03_23_131604) do

  create_table "class_registers", force: :cascade do |t|
    t.string "description"
    t.float "hours_lesson"
    t.float "lessons_week"
    t.float "salary"
    t.integer "location_id", null: false
    t.integer "student_id", null: false
    t.integer "subject_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tutor_gender"
    t.float "num_student"
    t.string "class_status", default: "ĐANG TÌM GIÁO VIÊN"
    t.text "class_content"
    t.string "address"
    t.index ["location_id"], name: "index_class_registers_on_location_id"
    t.index ["student_id"], name: "index_class_registers_on_student_id"
    t.index ["subject_id"], name: "index_class_registers_on_subject_id"
  end

  create_table "class_registers_times_frees", id: false, force: :cascade do |t|
    t.integer "class_register_id"
    t.integer "times_free_id"
    t.index ["class_register_id"], name: "index_class_registers_times_frees_on_class_register_id"
    t.index ["times_free_id"], name: "index_class_registers_times_frees_on_times_free_id"
  end

  create_table "class_registers_tutors", id: false, force: :cascade do |t|
    t.integer "class_register_id"
    t.integer "tutor_id"
    t.index ["class_register_id"], name: "index_class_registers_tutors_on_class_register_id"
    t.index ["tutor_id"], name: "index_class_registers_tutors_on_tutor_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "message_content"
    t.integer "user_id", null: false
    t.integer "tutor_id"
    t.integer "student_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "address"
    t.string "grade"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subjects_tutors", id: false, force: :cascade do |t|
    t.integer "tutor_id"
    t.integer "subject_id"
    t.index ["subject_id"], name: "index_subjects_tutors_on_subject_id"
    t.index ["tutor_id"], name: "index_subjects_tutors_on_tutor_id"
  end

  create_table "times_frees", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "free_time"
    t.string "day"
  end

  create_table "times_frees_tutors", id: false, force: :cascade do |t|
    t.integer "tutor_id"
    t.integer "times_free_id"
    t.index ["times_free_id"], name: "index_times_frees_tutors_on_times_free_id"
    t.index ["tutor_id"], name: "index_times_frees_tutors_on_tutor_id"
  end

  create_table "tutors", force: :cascade do |t|
    t.string "job"
    t.text "description"
    t.text "achievement"
    t.integer "point"
    t.integer "user_id", null: false
    t.integer "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "work_place"
    t.index ["location_id"], name: "index_tutors_on_location_id"
    t.index ["user_id"], name: "index_tutors_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.text "image"
    t.string "phone"
    t.integer "gender"
    t.float "bpoint"
    t.boolean "admin", default: false
    t.date "birthday"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "class_registers", "locations"
  add_foreign_key "class_registers", "students"
  add_foreign_key "class_registers", "subjects"
  add_foreign_key "class_registers_times_frees", "class_registers"
  add_foreign_key "class_registers_times_frees", "times_frees"
  add_foreign_key "class_registers_tutors", "class_registers"
  add_foreign_key "class_registers_tutors", "tutors"
  add_foreign_key "messages", "users"
  add_foreign_key "students", "users"
  add_foreign_key "subjects_tutors", "subjects"
  add_foreign_key "subjects_tutors", "tutors"
  add_foreign_key "times_frees_tutors", "times_frees"
  add_foreign_key "times_frees_tutors", "tutors"
  add_foreign_key "tutors", "locations"
  add_foreign_key "tutors", "users"
end
