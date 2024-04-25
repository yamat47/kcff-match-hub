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

ActiveRecord::Schema[7.1].define(version: 2024_04_25_062818) do
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

  create_table "administrators", comment: "管理者", force: :cascade do |t|
    t.string "email", null: false, comment: "メールアドレス"
    t.string "universal_id", null: false, comment: "ユニバーサルID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_administrators_on_email", unique: true
    t.index ["universal_id"], name: "index_administrators_on_universal_id", unique: true
  end

  create_table "game_fields", comment: "試合会場", force: :cascade do |t|
    t.string "universal_id", null: false, comment: "ユニバーサルID"
    t.string "name", null: false, comment: "会場名"
    t.string "address", null: false, comment: "住所"
    t.string "google_maps_url", null: false, comment: "GoogleマップURL"
    t.text "google_maps_embed_src_url", null: false, comment: "Googleマップ埋め込みURL"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_game_fields_on_name", unique: true
    t.index ["universal_id"], name: "index_game_fields_on_universal_id", unique: true
  end

  create_table "game_schedules", comment: "試合スケジュール", force: :cascade do |t|
    t.string "universal_id", null: false, comment: "ユニバーサルID"
    t.bigint "home_team_id", null: false, comment: "ホームチームID"
    t.bigint "visitor_team_id", null: false, comment: "ビジターチームID"
    t.bigint "game_field_id", null: false, comment: "試合会場ID"
    t.bigint "tournament_id", null: false, comment: "大会ID"
    t.datetime "start_at", null: false, comment: "試合開始日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_field_id"], name: "index_game_schedules_on_game_field_id"
    t.index ["home_team_id"], name: "index_game_schedules_on_home_team_id"
    t.index ["tournament_id"], name: "index_game_schedules_on_tournament_id"
    t.index ["universal_id"], name: "index_game_schedules_on_universal_id", unique: true
    t.index ["visitor_team_id"], name: "index_game_schedules_on_visitor_team_id"
  end

  create_table "team_profiles", comment: "チーム情報", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.string "x_url"
    t.string "instagram_url"
    t.string "homepage_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_profiles_on_team_id", unique: true
  end

  create_table "teams", force: :cascade do |t|
    t.string "universal_id", null: false, comment: "ユニバーサルID"
    t.string "name", null: false, comment: "チーム名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["universal_id"], name: "index_teams_on_universal_id", unique: true
  end

  create_table "tournaments", comment: "大会", force: :cascade do |t|
    t.string "universal_id", null: false, comment: "ユニバーサルID"
    t.string "name", null: false, comment: "大会名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tournaments_on_name"
    t.index ["universal_id"], name: "index_tournaments_on_universal_id", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "game_schedules", "game_fields"
  add_foreign_key "game_schedules", "teams", column: "home_team_id"
  add_foreign_key "game_schedules", "teams", column: "visitor_team_id"
  add_foreign_key "game_schedules", "tournaments"
  add_foreign_key "team_profiles", "teams"
end
