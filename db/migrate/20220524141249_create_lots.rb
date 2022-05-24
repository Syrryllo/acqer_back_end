class CreateLots < ActiveRecord::Migration[6.1]
  def change
    create_table :lots do |t|
      t.string :lot_number
      t.string :lot_designation
      t.string :lot_location_in_building
      t.decimal :surface
      t.boolean :primary_lot
      t.references :building, null: false, foreign_key: true
      t.references :dwelling, null: false, foreign_key: true

      t.timestamps
    end
  end
end
