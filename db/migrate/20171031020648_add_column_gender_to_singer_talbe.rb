class AddColumnGenderToSingerTalbe < ActiveRecord::Migration[5.1]
  def change
    add_column :singers, :gender, :integer, default: 1
  end
end
