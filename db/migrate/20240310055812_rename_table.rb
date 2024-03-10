class RenameTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :my_desk_tables, :my_desks
  end
end
