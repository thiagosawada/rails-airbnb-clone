class CreateMeetings < ActiveRecord::Migration[5.1]
  def change
    create_table :meetings do |t|
      t.string :city
      t.string :location
      t.string :duration
      t.integer :group_size
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
