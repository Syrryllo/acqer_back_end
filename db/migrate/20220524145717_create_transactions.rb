class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.date :date
      t.references :account_credited, null: false, foreign_key: true
      t.references :account_debited, null: false, foreign_key: true

      t.timestamps
    end
  end
end
