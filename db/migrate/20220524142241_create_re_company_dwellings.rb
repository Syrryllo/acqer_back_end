class CreateReCompanyDwellings < ActiveRecord::Migration[6.1]
  def change
    create_table :re_company_dwellings do |t|
      t.references :re_company, null: false, foreign_key: true
      t.references :dwelling, null: false, foreign_key: true

      t.timestamps
    end
  end
end
