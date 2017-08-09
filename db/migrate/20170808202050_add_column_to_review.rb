class AddColumnToReview < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :head, :string
  end
end
