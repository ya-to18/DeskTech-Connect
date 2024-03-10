class CreateMyDeskTable < ActiveRecord::Migration[7.0]
  def change
    create_table :my_desk_tables do |t|
      t.string :name, null: false
      t.references :users, foreign_key: true
      t.timestamps
    end
  end
end
