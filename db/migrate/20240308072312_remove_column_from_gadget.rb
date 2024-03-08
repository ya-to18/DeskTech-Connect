class RemoveColumnFromGadget < ActiveRecord::Migration[7.0]
  def change
    remove_column :gadgets, :maker_name
    remove_column :gadgets, :maker_code
    remove_column :gadgets, :genre
  end
end
