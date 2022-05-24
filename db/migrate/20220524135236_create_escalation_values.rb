class CreateEscalationValues < ActiveRecord::Migration[6.1]
  def change
    create_table :escalation_values do |t|
      t.string :name
      t.string :period
      t.integer :value

      t.timestamps
    end
  end
end
