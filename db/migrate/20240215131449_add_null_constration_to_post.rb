class AddNullConstrationToPost < ActiveRecord::Migration[7.0]
  def change
    change_column_null :posts, :image, false
    change_column_null :posts, :content, false
  end
end
