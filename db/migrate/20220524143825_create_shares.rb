class CreateShares < ActiveRecord::Migration[6.1]
  def change
    create_table :shares do |t|
      t.integer :share_number
      t.references :stakeholder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
