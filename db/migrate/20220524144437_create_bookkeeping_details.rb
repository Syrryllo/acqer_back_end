class CreateBookkeepingDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :bookkeeping_details do |t|
      t.integer :account_number
      t.text :account_details
      t.references :stakeholder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
