class Restaurant < ApplicationRecord
  has_many :users, through: :reservations
  has_many :reservations
  belongs_to :category
  # belongs_to :owner
end
