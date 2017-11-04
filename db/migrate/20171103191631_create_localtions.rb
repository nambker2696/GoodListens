class CreateLocaltions < ActiveRecord::Migration[5.1]
  def change
    create_table :localtions do |t|
    	t.string :name

      t.timestamps
    end
  end
end
