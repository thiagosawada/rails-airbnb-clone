class Meeting < ApplicationRecord
  has_many :groups
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def address
    [location, city].compact.join(', ')
  end
end
