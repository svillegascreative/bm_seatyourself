class Reservation < ApplicationRecord

  belongs_to :user
  belongs_to :restaurant

  validates :seats, :datetime, :year, :month, :day, :hour, presence: true

end
