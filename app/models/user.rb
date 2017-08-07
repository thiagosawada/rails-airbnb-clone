class User < ApplicationRecord
  has_many :groups
  has_many :meetings, through: :groups
  has_many :reviews
end
