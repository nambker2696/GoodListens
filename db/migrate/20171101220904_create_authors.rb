class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :gender, default: 1
      t.integer :age, default: 20
      t.string :avatar, default: "/assets/images/fallback/ava-default-male.jpg"
      t.timestamps
    end
  end
end
