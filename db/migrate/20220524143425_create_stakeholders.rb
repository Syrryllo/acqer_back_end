class CreateStakeholders < ActiveRecord::Migration[6.1]
  def change
    create_table :stakeholders do |t|
      t.string :category
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :nationality
      t.date :date_of_birth
      t.string :marital_status
      t.string :spouse_first_name
      t.string :spouse_last_name
      t.decimal :revenue_per_year
      t.string :bank_iban
      t.integer :telephone_number
      t.string :email
      t.string :address_street_number
      t.string :address_street
      t.string :address_city
      t.string :address_zipcode
      t.string :address_country
      t.string :company_name
      t.string :company_rcs_number
      t.string :company_registry_city
      t.decimal :company_equity
      t.string :company_director

      t.timestamps
    end
  end
end
