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

ActiveRecord::Schema[7.1].define(version: 2024_07_30_201724) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classrooms", force: :cascade do |t|
    t.string "room_number", null: false
    t.string "building", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_number", "building"], name: "index_classrooms_on_room_number_and_building", unique: true
  end

  create_table "sections", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "teacher_subject_id", null: false
    t.bigint "classroom_id", null: false
    t.integer "weekdays", default: [], null: false, array: true
    t.time "start_at", null: false
    t.time "end_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_sections_on_classroom_id"
    t.index ["teacher_subject_id"], name: "index_sections_on_teacher_subject_id"
  end

  create_table "student_sections", force: :cascade do |t|
    t.bigint "section_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id", "student_id"], name: "index_student_sections_on_section_id_and_student_id", unique: true
    t.index ["section_id"], name: "index_student_sections_on_section_id"
    t.index ["student_id"], name: "index_student_sections_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.text "first_name", null: false
    t.text "last_name", null: false
    t.string "reference_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reference_number"], name: "index_students_on_reference_number", unique: true
  end

  create_table "subjects", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teacher_subjects", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_teacher_subjects_on_subject_id"
    t.index ["teacher_id", "subject_id"], name: "index_teacher_subjects_on_teacher_id_and_subject_id", unique: true
    t.index ["teacher_id"], name: "index_teacher_subjects_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "reference_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reference_number"], name: "index_teachers_on_reference_number", unique: true
  end

  add_foreign_key "sections", "classrooms"
  add_foreign_key "sections", "teacher_subjects"
  add_foreign_key "student_sections", "sections"
  add_foreign_key "student_sections", "students"
  add_foreign_key "teacher_subjects", "subjects"
  add_foreign_key "teacher_subjects", "teachers"
end
