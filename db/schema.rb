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

ActiveRecord::Schema.define(version: 2022_05_25_144450) do

  create_table "basic_monthly_payments", force: :cascade do |t|
    t.decimal "amount"
    t.date "calculation_date"
    t.integer "escalation_value_id", null: false
    t.integer "dwelling_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dwelling_id"], name: "index_basic_monthly_payments_on_dwelling_id"
    t.index ["escalation_value_id"], name: "index_basic_monthly_payments_on_escalation_value_id"
  end

  create_table "bookkeeping_details", force: :cascade do |t|
    t.integer "account_number"
    t.text "account_details"
    t.integer "stakeholder_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stakeholder_id"], name: "index_bookkeeping_details_on_stakeholder_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.string "address_street_number"
    t.string "address_street"
    t.string "address_city"
    t.string "address_zipcode"
    t.string "address_country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dwelling_valuations", force: :cascade do |t|
    t.decimal "amount"
    t.string "valuer"
    t.string "method"
    t.date "date"
    t.integer "dwelling_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dwelling_id"], name: "index_dwelling_valuations_on_dwelling_id"
  end

  create_table "dwellings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "escalation_values", force: :cascade do |t|
    t.string "name"
    t.string "period"
    t.integer "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lots", force: :cascade do |t|
    t.string "lot_number"
    t.string "lot_designation"
    t.string "lot_location_in_building"
    t.decimal "surface"
    t.boolean "primary_lot"
    t.integer "building_id", null: false
    t.integer "dwelling_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["building_id"], name: "index_lots_on_building_id"
    t.index ["dwelling_id"], name: "index_lots_on_dwelling_id"
  end

  create_table "re_companies", force: :cascade do |t|
    t.string "name"
    t.string "rcs_number"
    t.string "registry_city"
    t.decimal "equity"
    t.decimal "min_capital"
    t.decimal "max_capital"
    t.string "director"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "re_company_dwellings", force: :cascade do |t|
    t.integer "re_company_id", null: false
    t.integer "dwelling_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dwelling_id"], name: "index_re_company_dwellings_on_dwelling_id"
    t.index ["re_company_id"], name: "index_re_company_dwellings_on_re_company_id"
  end

  create_table "re_company_stakeholders", force: :cascade do |t|
    t.integer "re_company_id", null: false
    t.integer "stakeholder_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["re_company_id"], name: "index_re_company_stakeholders_on_re_company_id"
    t.index ["stakeholder_id"], name: "index_re_company_stakeholders_on_stakeholder_id"
  end

  create_table "shareholder_loans", force: :cascade do |t|
    t.decimal "amount"
    t.integer "stakeholder_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stakeholder_id"], name: "index_shareholder_loans_on_stakeholder_id"
  end

  create_table "shares", force: :cascade do |t|
    t.integer "share_number"
    t.integer "stakeholder_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stakeholder_id"], name: "index_shares_on_stakeholder_id"
  end

  create_table "stakeholders", force: :cascade do |t|
    t.string "category"
    t.string "title"
    t.string "first_name"
    t.string "last_name"
    t.string "nationality"
    t.date "date_of_birth"
    t.string "marital_status"
    t.string "spouse_first_name"
    t.string "spouse_last_name"
    t.decimal "revenue_per_year"
    t.string "bank_iban"
    t.integer "telephone_number"
    t.string "email"
    t.string "address_street_number"
    t.string "address_street"
    t.string "address_city"
    t.string "address_zipcode"
    t.string "address_country"
    t.string "company_name"
    t.string "company_rcs_number"
    t.string "company_registry_city"
    t.decimal "company_equity"
    t.string "company_director"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "amount"
    t.date "date"
    t.integer "account_credited_id", null: false
    t.integer "account_debited_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_credited_id"], name: "index_transactions_on_account_credited_id"
    t.index ["account_debited_id"], name: "index_transactions_on_account_debited_id"
  end

  add_foreign_key "basic_monthly_payments", "dwellings"
  add_foreign_key "basic_monthly_payments", "escalation_values"
  add_foreign_key "bookkeeping_details", "stakeholders"
  add_foreign_key "dwelling_valuations", "dwellings"
  add_foreign_key "lots", "buildings"
  add_foreign_key "lots", "dwellings"
  add_foreign_key "re_company_dwellings", "dwellings"
  add_foreign_key "re_company_dwellings", "re_companies"
  add_foreign_key "re_company_stakeholders", "re_companies"
  add_foreign_key "re_company_stakeholders", "stakeholders"
  add_foreign_key "shareholder_loans", "stakeholders"
  add_foreign_key "shares", "stakeholders"
  add_foreign_key "transactions", "account_crediteds"
  add_foreign_key "transactions", "account_debiteds"
end
