class CreateShareholderLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :shareholder_loans do |t|
      t.decimal :amount
      t.references :stakeholder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
