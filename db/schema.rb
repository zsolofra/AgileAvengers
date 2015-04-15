# encoding: UTF-8
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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20150415002150) do
=======
ActiveRecord::Schema.define(version: 20150415013102) do
>>>>>>> f0f35f19167c31f3ea875b1ca73f37bdc7e8e387

  create_table "properties", force: :cascade do |t|
    t.string   "address"
    t.string   "bedrooms"
    t.string   "bathrooms"
    t.string   "rent"
    t.string   "pets"
    t.string   "utilities"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "likes"
    t.integer  "dislikes"
    t.string   "user_id"
    t.text     "review"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
