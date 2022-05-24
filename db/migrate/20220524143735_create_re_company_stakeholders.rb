class CreateReCompanyStakeholders < ActiveRecord::Migration[6.1]
  def change
    create_table :re_company_stakeholders do |t|
      t.references :re_company, null: false, foreign_key: true
      t.references :stakeholder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
