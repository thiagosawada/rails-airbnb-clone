class Meeting < ApplicationRecord
  has_many :groups
  belongs_to :user
  belongs_to :category
  validates :category_id, presence: true
end
