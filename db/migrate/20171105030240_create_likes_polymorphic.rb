class CreateLikesPolymorphic < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.references :target, polymorphic: true, index: true
      t.timestamps
    end
  end
end
