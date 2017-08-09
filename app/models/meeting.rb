class Meeting < ApplicationRecord
  has_many :groups
  belongs_to :user

  validates :name, :duration, :group_size, :category, presence: true

  validate :date_cannot_be_in_the_past
  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

end
