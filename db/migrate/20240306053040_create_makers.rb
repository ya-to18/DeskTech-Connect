class CreateMakers < ActiveRecord::Migration[7.0]
  def change
    create_table :makers do |t|
      t.string :name
      t.bigint :code, null: false, default: 0

      t.timestamps
    end
  end
end
