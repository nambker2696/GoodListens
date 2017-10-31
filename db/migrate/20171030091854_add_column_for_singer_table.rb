class AddColumnForSingerTable < ActiveRecord::Migration[5.1]
  def change
    add_column :singers, :age, :integer, default: 20
    add_column :singers, :avatar, :string, default: "/assets/images/fallback/ava-default-male.jpg"
  end
end
