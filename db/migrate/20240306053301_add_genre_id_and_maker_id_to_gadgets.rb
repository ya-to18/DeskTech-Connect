class AddGenreIdAndMakerIdToGadgets < ActiveRecord::Migration[7.0]
  def change
    add_reference :gadgets, :genre, foreign_key: true
    add_reference :gadgets, :maker, foreign_key: true
  end
end
