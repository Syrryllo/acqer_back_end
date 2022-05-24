class CreateDwellingValuations < ActiveRecord::Migration[6.1]
  def change
    create_table :dwelling_valuations do |t|
      t.decimal :amount
      t.string :valuer
      t.string :method
      t.date :date
      t.references :dwelling, null: false, foreign_key: true

      t.timestamps
    end
  end
end
