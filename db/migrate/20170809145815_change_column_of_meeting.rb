class ChangeColumnOfMeeting < ActiveRecord::Migration[5.1]
  def change
     change_column :meetings, :date, :datetime
  end
end
