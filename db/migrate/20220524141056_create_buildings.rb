class CreateBuildings < ActiveRecord::Migration[6.1]
  def change
    create_table :buildings do |t|
      t.string :address_street_number
      t.string :address_street
      t.string :address_city
      t.string :address_zipcode
      t.string :address_country

      t.timestamps
    end
  end
end
