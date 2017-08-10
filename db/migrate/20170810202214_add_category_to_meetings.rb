class AddCategoryToMeetings < ActiveRecord::Migration[5.1]
  def change
    add_reference :meetings, :category, foreign_key: true
  end
end
