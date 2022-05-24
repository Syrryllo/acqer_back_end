class CreateBasicMonthlyPayments < ActiveRecord::Migration[6.1]
  def change
    create_table :basic_monthly_payments do |t|
      t.decimal :amount
      t.date :calculation_date
      t.references :escalation_value, null: false, foreign_key: true
      t.references :dwelling, null: false, foreign_key: true

      t.timestamps
    end
  end
end
