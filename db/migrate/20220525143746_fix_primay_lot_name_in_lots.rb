class FixPrimayLotNameInLots < ActiveRecord::Migration[6.1]
  def change
    rename_column :lots, :primary_lot, :primary_lot?
  end
end
