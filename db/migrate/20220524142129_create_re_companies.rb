class CreateReCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :re_companies do |t|
      t.string :name
      t.string :rcs_number
      t.string :registry_city
      t.decimal :equity
      t.decimal :min_capital
      t.decimal :max_capital
      t.string :director

      t.timestamps
    end
  end
end
