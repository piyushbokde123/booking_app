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

ActiveRecord::Schema[7.1].define(version: 2024_04_07_095035) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "bookings", force: :cascade do |t|
    t.string "detail"
    t.time "show_timing"
    t.integer "total_seats"
    t.bigint "show_time_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.text "seat_number", default: [], array: true
    t.bigint "user_id", null: false
    t.bigint "movie_id", null: false
    t.index ["movie_id"], name: "index_bookings_on_movie_id"
    t.index ["show_time_id"], name: "index_bookings_on_show_time_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "details", force: :cascade do |t|
    t.string "movie"
    t.date "show_time"
    t.integer "seat_no"
    t.bigint "show_time_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_time_id"], name: "index_details_on_show_time_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seats", force: :cascade do |t|
    t.integer "seat_number"
    t.boolean "available"
    t.float "price"
    t.bigint "show_time_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_time_id"], name: "index_seats_on_show_time_id"
  end

  create_table "show_times", force: :cascade do |t|
    t.time "start_time"
    t.integer "seat_count"
    t.bigint "movie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.index ["movie_id"], name: "index_show_times_on_movie_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "movies"
  add_foreign_key "bookings", "show_times"
  add_foreign_key "bookings", "users"
  add_foreign_key "details", "show_times"
  add_foreign_key "seats", "show_times"
  add_foreign_key "show_times", "movies"
end