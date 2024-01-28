class ChangeMakerNameToBigint < ActiveRecord::Migration[7.0]
  def change
    change_column :gadgets, :maker_code, :bigint, null: false, default: 0
  end
end
