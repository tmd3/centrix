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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120201181022) do

  create_table "ins_co_offices", :force => true do |t|
    t.string   "name"
    t.string   "tel_nr"
    t.integer  "parent_co"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
  end

  create_table "insurance_cos", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "insurance_cos", ["url"], :name => "index_insurance_cos_on_url", :unique => true

  create_table "kases", :force => true do |t|
    t.string   "claim_nr"
    t.integer  "rep"
    t.integer  "insuree"
    t.integer  "product"
    t.string   "status"
    t.integer  "engineer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reps", :force => true do |t|
    t.string   "name"
    t.string   "tel_nr"
    t.string   "fax_nr"
    t.string   "email"
    t.integer  "office"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
