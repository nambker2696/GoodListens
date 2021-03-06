class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug, null: false, default: ""
      t.timestamps
    end
  end
end
