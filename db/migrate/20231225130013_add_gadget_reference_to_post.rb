class AddGadgetReferenceToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :gadgets, :post, foreign_key: true
  end
end
