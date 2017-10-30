class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :description
      t.string :author_name
      t.integer :sum_rate
      t.float :rate_avg
      t.string :cover

      t.timestamps
    end
  end
end
