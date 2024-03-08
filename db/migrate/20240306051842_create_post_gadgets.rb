class CreatePostGadgets < ActiveRecord::Migration[7.0]
  def change
    create_table :post_gadgets do |t|
      t.references :post, null: false, foreign_key: true
      t.references :gadget, null: false, foreign_key: true

      t.timestamps
    end
  end
end
