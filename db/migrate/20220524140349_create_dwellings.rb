class CreateDwellings < ActiveRecord::Migration[6.1]
  def change
    create_table :dwellings do |t|
      t.string :name

      t.timestamps
    end
  end
end
