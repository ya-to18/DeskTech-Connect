class RemoveForeignKeyFromGadget < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :gadgets, :posts
    remove_index :gadgets, :post_id
    remove_column :gadgets, :post_id, :bigint
  end
end
