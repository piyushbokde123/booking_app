class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :role, presence: true
  has_many :bookings, dependent: :destroy
  enum role: { "admin": 0, "user": 1 }
end
