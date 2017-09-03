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

ActiveRecord::Schema.define(version: 20170903175822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pi_digits", force: :cascade do |t|
    t.bigint "digit", null: false
    t.bigint "two_digits"
    t.bigint "three_digits"
    t.bigint "four_digits"
    t.bigint "five_digits"
    t.bigint "six_digits"
    t.bigint "seven_digits"
    t.bigint "eight_digits"
    t.bigint "nine_digits"
    t.bigint "ten_digits"
    t.index ["digit"], name: "index_pi_digits_on_digit"
  end

end
