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

ActiveRecord::Schema.define(version: 2019_12_17_152637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "cube"
  enable_extension "earthdistance"
  enable_extension "pg_trgm"
  enable_extension "plpgsql"
  enable_extension "unaccent"


  create_table "currencies", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "symbol", null: false
    t.string "code", null: false
    t.boolean "default", default: false, null: false
    t.string "delimiter"
    t.string "separator"
    t.integer "decimals"
    t.integer "pos"
    t.float "quote"
  end


  create_table "languages", id: :serial, force: :cascade do |t|
    t.string "name", limit: 100
    t.string "code", limit: 5
    t.string "display_name"
    t.string "flag_code"
    t.integer "currency_id"
    t.index ["currency_id"], name: "index_languages_on_currency_id"
  end


end
