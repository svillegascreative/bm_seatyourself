class User < ApplicationRecord
  has_secure_password

  has_many :reservations
  has_many :restaurants

  validates :name, :password_digest, :email, presence: true

end
