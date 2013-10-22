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

ActiveRecord::Schema.define(version: 20131020180857) do

  create_table "loan_attribute_types", force: true do |t|
    t.string   "name"
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "field_type"
  end

  create_table "loan_attributes", force: true do |t|
    t.string   "name"
    t.string   "label"
    t.string   "unit"
    t.integer  "loan_attribute_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loan_lenders", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loan_product_attributes", force: true do |t|
    t.integer  "loan_product_id"
    t.integer  "loan_attribute_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "loan_product_attributes", ["loan_attribute_id"], name: "index_loan_product_attributes_on_loan_attribute_id", using: :btree
  add_index "loan_product_attributes", ["loan_product_id", "loan_attribute_id"], name: "index_unique_loan_product_attributes", unique: true, using: :btree
  add_index "loan_product_attributes", ["loan_product_id"], name: "index_loan_product_attributes_on_loan_product_id", using: :btree

  create_table "loan_products", force: true do |t|
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "enabled"
    t.integer  "loan_lender_id"
    t.string   "slug"
    t.string   "name"
    t.integer  "loan_servicer_id"
    t.string   "logo"
    t.integer  "cosigner_release_available"
    t.text     "cosigner_release_note"
    t.string   "external_url"
    t.decimal  "auto_debit_discount",        precision: 5, scale: 2
    t.text     "auto_debit_discount_note"
    t.decimal  "loyality_discount",          precision: 5, scale: 2
    t.text     "loyality_discount_note"
    t.integer  "type_refinanced"
    t.decimal  "interest_rate_index",        precision: 5, scale: 2
    t.text     "interest_rate_index_note"
    t.decimal  "min_repayment_rate",         precision: 5, scale: 2
    t.text     "min_repayment_rate_note"
    t.decimal  "max_repayment_rate",         precision: 5, scale: 2
    t.text     "max_repayment_rate_note"
    t.decimal  "origination_fee",            precision: 5, scale: 2
    t.text     "early_repayment_penalty"
    t.text     "notes"
    t.text     "top_header"
    t.text     "extra_top_summary"
    t.text     "summary"
    t.string   "disclosure"
  end

  add_index "loan_products", ["loan_lender_id"], name: "index_loan_products_on_loan_lender_id", using: :btree
  add_index "loan_products", ["loan_servicer_id"], name: "index_loan_products_on_loan_servicer_id", using: :btree

  create_table "loan_servicers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
