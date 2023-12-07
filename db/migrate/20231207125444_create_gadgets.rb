class CreateGadgets < ActiveRecord::Migration[7.0]
  def change
    create_table :gadgets do |t|
      t.string :name, null: false
      t.string :brand
      t.integer :price
      t.string :image_url
      t.integer :genre

      t.timestamps
    end
  end
end
