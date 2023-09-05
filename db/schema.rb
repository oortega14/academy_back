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

ActiveRecord::Schema[7.0].define(version: 2022_07_15_020149) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_us_sections", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "academy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academy_id"], name: "index_about_us_sections_on_academy_id"
  end

  create_table "academies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "slogan"
    t.bigint "academy_category_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academy_category_id"], name: "index_academies_on_academy_category_id"
    t.index ["user_id"], name: "index_academies_on_user_id"
  end

  create_table "academy_categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "academy_configurations", force: :cascade do |t|
    t.string "domain"
    t.json "colors"
    t.bigint "academy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academy_id"], name: "index_academy_configurations_on_academy_id"
  end

  create_table "academy_contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "message"
    t.bigint "academy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academy_id"], name: "index_academy_contacts_on_academy_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "archives", force: :cascade do |t|
    t.string "archivable_type"
    t.bigint "archivable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["archivable_type", "archivable_id"], name: "index_archives_on_archivable"
  end

  create_table "course_tests", force: :cascade do |t|
    t.integer "time_limit"
    t.integer "approve_with", default: 0
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_tests_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title", null: false
    t.string "subtitle"
    t.string "price"
    t.string "description"
    t.integer "stars", default: 0
    t.bigint "teacher_id"
    t.bigint "academy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academy_id"], name: "index_courses_on_academy_id"
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "exam_answers", force: :cascade do |t|
    t.boolean "right", default: false
    t.bigint "exam_id", null: false
    t.bigint "test_question_id", null: false
    t.bigint "question_option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_exam_answers_on_exam_id"
    t.index ["question_option_id"], name: "index_exam_answers_on_question_option_id"
    t.index ["test_question_id"], name: "index_exam_answers_on_test_question_id"
  end

  create_table "exams", force: :cascade do |t|
    t.boolean "approved", default: false
    t.integer "right_answers", default: 0
    t.bigint "user_id", null: false
    t.bigint "course_test_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_test_id"], name: "index_exams_on_course_test_id"
    t.index ["user_id"], name: "index_exams_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.boolean "visible", default: false
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_lessons_on_course_id"
  end

  create_table "question_options", force: :cascade do |t|
    t.string "option_text"
    t.boolean "right_answer", default: false
    t.bigint "test_question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_question_id"], name: "index_question_options_on_test_question_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "description"
    t.integer "stars", default: 0
    t.bigint "course_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_reviews_on_course_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "social_networks", force: :cascade do |t|
    t.string "web_site"
    t.string "facebook_profile_url"
    t.string "instagram_profile_url"
    t.string "linked_in_profile_url"
    t.string "twitter_profile_url"
    t.string "youtube_profile_url"
    t.string "tiktok_profile_url"
    t.bigint "academy_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academy_id"], name: "index_social_networks_on_academy_id"
    t.index ["user_id"], name: "index_social_networks_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_students_on_course_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "test_questions", force: :cascade do |t|
    t.string "question"
    t.bigint "course_test_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_test_id"], name: "index_test_questions_on_course_test_id"
  end

  create_table "user_configurations", force: :cascade do |t|
    t.boolean "public_profile", default: false
    t.boolean "promotions_email", default: false
    t.boolean "instructors_emails", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_configurations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "dni"
    t.string "college_degree"
    t.string "description"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.integer "role"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "about_us_sections", "academies"
  add_foreign_key "academies", "academy_categories"
  add_foreign_key "academies", "users"
  add_foreign_key "academy_configurations", "academies"
  add_foreign_key "academy_contacts", "academies"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "course_tests", "courses"
  add_foreign_key "courses", "academies"
  add_foreign_key "courses", "users", column: "teacher_id"
  add_foreign_key "exam_answers", "exams"
  add_foreign_key "exam_answers", "question_options"
  add_foreign_key "exam_answers", "test_questions"
  add_foreign_key "exams", "course_tests"
  add_foreign_key "exams", "users"
  add_foreign_key "lessons", "courses"
  add_foreign_key "question_options", "test_questions"
  add_foreign_key "reviews", "courses"
  add_foreign_key "reviews", "users"
  add_foreign_key "social_networks", "academies"
  add_foreign_key "social_networks", "users"
  add_foreign_key "students", "courses"
  add_foreign_key "students", "users"
  add_foreign_key "test_questions", "course_tests"
  add_foreign_key "user_configurations", "users"
end
