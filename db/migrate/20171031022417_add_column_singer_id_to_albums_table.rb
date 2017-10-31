class AddColumnSingerIdToAlbumsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :singer_id, :integer
  end
end
