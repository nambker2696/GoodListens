class CreateSingers < ActiveRecord::Migration[5.1]
  def change
    create_table :singers do |t|
      t.string :name
      t.integer :gender, default: 1
      t.integer :age, default: 20
      t.string :localtion_id
      # t.string :avatar, default: "/assets/images/fallback/ava-default-male.jpg"
      t.string :avatar, default: ""
      t.timestamps
    end
  end
end
