class CreatePostGadgets < ActiveRecord::Migration[7.0]
  def change
    create_table :post_gadgets do |t|
      t.references :post, foreign_key: true
      t.references :gadget, foreign_key: true

      t.timestamps
    end
  end
end
