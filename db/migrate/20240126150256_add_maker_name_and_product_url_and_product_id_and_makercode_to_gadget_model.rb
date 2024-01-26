class AddMakerNameAndProductUrlAndProductIdAndMakercodeToGadgetModel < ActiveRecord::Migration[7.0]
  def change
    add_column :gadgets, :product_url, :string
    add_column :gadgets, :product_id, :string
    add_column :gadgets, :maker_name, :string
    add_column :gadgets, :maker_code, :integer
  end
end
