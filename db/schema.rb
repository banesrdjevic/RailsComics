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

ActiveRecord::Schema.define(version: 2019_10_24_014358) do

  create_table "sites", force: :cascade do |t|
    t.string "site_url"
    t.string "picture_url"
    t.string "orig_pic_url"
    t.string "classes"
    t.string "ids"
    t.string "container"
    t.string "domain"
    t.string "title"
    t.string "icon_url"
    t.string "language"
    t.string "new"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
