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

ActiveRecord::Schema.define(version: 20151003234724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "commuters", force: :cascade do |t|
    t.string  "name"
    t.string  "email_address"
    t.integer "SMS_number"
    t.string  "twitter_handle"
  end

  create_table "commutes", force: :cascade do |t|
    t.integer "commuter_id"
    t.string  "name"
  end

  create_table "road_restrictions", force: :cascade do |t|
    t.geometry "coord",             limit: {:srid=>4326, :type=>"point"}
    t.string   "description"
    t.string   "road_segment_name"
  end

  create_table "route_steps", force: :cascade do |t|
    t.integer  "route_id"
    t.geometry "coord",          limit: {:srid=>4326, :type=>"line_string"}
    t.integer  "sequence_index"
  end

end
