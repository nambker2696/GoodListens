class DropLikes < ActiveRecord::Migration[5.1]
  def change
    drop_table :likes
  end
end
