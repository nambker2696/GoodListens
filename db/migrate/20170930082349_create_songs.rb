class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :description
      t.string :author_name
      t.integer :sum_rate
      t.float :rate_avg
      #chua add column photo vs song file
      t.timestamps
    end
  end
end
