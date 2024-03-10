class CreateMyDeskGadgets < ActiveRecord::Migration[7.0]
  def change
    create_table :my_desk_gadgets do |t|
      t.references :my_desks, null: false, foreign_key: true
      t.references :gadgets, null: false, foreign_key: true

      t.timestamps
    end
  end
end
