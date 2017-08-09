class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :birth_day, :string
    add_column :users, :user_city, :string
    add_column :users, :gender, :string
  end
end
