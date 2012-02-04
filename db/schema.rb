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

ActiveRecord::Schema.define(:version => 20120203205347) do

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
    t.string   "zipcode"
  end

  create_table "insurance_cos", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "insurance_cos", ["url"], :name => "index_insurance_cos_on_url", :unique => true

  create_table "kases", :force => true do |t|
    t.integer  "rep"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "case_no"
    t.string   "claim_no"
    t.integer  "assigned_to"
    t.integer  "owned_by"
    t.string   "insured_name"
    t.string   "insured_address"
    t.string   "insured_city"
    t.string   "insured_state"
    t.string   "insured_zipcode"
    t.string   "insured_phone_no"
    t.string   "insured_email"
    t.date     "date_of_loss"
    t.string   "product"
    t.string   "no_of_products"
    t.integer  "manufacturer"
    t.string   "additional_evidence"
    t.date     "date_received"
    t.date     "promised_by_date"
    t.date     "date_sent"
    t.integer  "report_prepared_by"
    t.integer  "report_revised_by"
    t.date     "billed_until_date"
    t.string   "type_of_report"
    t.string   "disposition"
    t.string   "delivered_by"
  end

  create_table "manufacturers", :force => true do |t|
    t.string   "name"
    t.string   "brands"
    t.integer  "parent_co"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "phone_no"
    t.string   "fax_no"
    t.string   "website"
    t.string   "documents_and_manuals"
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
