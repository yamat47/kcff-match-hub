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

ActiveRecord::Schema[7.1].define(version: 2024_02_12_133108) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "tournaments", comment: "大会", force: :cascade do |t|
    t.string "universal_id", null: false, comment: "ユニバーサルID"
    t.string "name", null: false, comment: "大会名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tournaments_on_name"
    t.index ["universal_id"], name: "index_tournaments_on_universal_id", unique: true
  end

end
