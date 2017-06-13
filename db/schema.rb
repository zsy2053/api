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

ActiveRecord::Schema.define(version: 20170610151526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string   "start_date"
    t.string   "end_date"
    t.integer  "car_id"
    t.integer  "tool_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "renter_id"
    t.integer  "leaser_id"
    t.integer  "price"
  end

  create_table "buildings", force: :cascade do |t|
    t.string   "address"
    t.integer  "phone_number"
    t.string   "city"
    t.string   "postal_code"
    t.string   "province"
    t.integer  "num_units"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "car_photos", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "car_id"
  end

  create_table "cars", force: :cascade do |t|
    t.integer  "year"
    t.string   "make"
    t.string   "model"
    t.integer  "km"
    t.string   "tran"
    t.string   "fuel_type"
    t.integer  "weekday_price"
    t.string   "plate_num"
    t.string   "color"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "weekend_price"
    t.text     "description"
  end

  create_table "id_photos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "image"
    t.string   "exp"
    t.string   "dob"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "booking_id"
    t.string   "sender"
    t.string   "title"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "taxes"
    t.integer  "price"
    t.integer  "deposit"
    t.integer  "final_payment"
    t.integer  "insurance_fee"
    t.integer  "number_nights"
    t.integer  "total_price"
    t.integer  "booking_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "renter_id"
    t.integer  "leaser_id"
  end

  create_table "tool_photos", force: :cascade do |t|
    t.string   "image"
    t.integer  "tool_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tools", force: :cascade do |t|
    t.string   "tool_type"
    t.string   "category"
    t.integer  "price"
    t.string   "brand"
    t.text     "description"
    t.string   "condition"
    t.string   "location"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "power"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "address"
    t.string   "age"
    t.string   "gender"
    t.string   "password_digest"
    t.string   "image"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "admin"
    t.string   "avatar"
    t.boolean  "email_confirmed",   default: false
    t.string   "confirm_token"
    t.boolean  "register_complete"
    t.boolean  "has_booked",        default: false
    t.boolean  "valid_payment",     default: false
    t.string   "stripe_id"
  end

end
