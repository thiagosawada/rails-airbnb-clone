class AddColumnToMeeting < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :description, :text
    add_column :meetings, :time, :string
    add_column :meetings, :date, :date
  end
end
