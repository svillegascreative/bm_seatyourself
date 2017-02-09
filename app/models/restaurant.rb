class Restaurant < ApplicationRecord
  has_many :reservations
  belongs_to :category
  belongs_to :user

  validates :name, :address, :capacity, :phone, presence: true
  validates :capacity, numericality: true

  def available?(seats, time)
    available_capacity(time) - seats >= 0
  end

  def available_capacity(time)
    capacity - reservations_at(time).sum(:seats)
  end

  def reservations_at(time)
    reservations.where(datetime: time)
  end

end
