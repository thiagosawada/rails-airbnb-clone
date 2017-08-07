class AddCoachToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :coach, foreign_key: { to_table: :users }, index: true
  end
end
