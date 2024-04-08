class ShowTime < ApplicationRecord
  belongs_to :movie
  has_many :bookings, dependent: :destroy
  has_many :seats, dependent: :destroy
  validates :date, :start_time, :seat_count, presence: true
  validate :check_seat_count, :check_date
  after_create :create_seats

  def available_seats
    self.seats.where(available: true).count
  end
 
  private
 
  def check_seat_count
    errors.add(:seats, message: "seats cannot be less then 5") if self.seat_count.to_i < 5
  end

  def create_seats
    count = self.seat_count.to_i
    (1..count).each do |i|  
       self.seats.create(seat_number: i, available: true, price: 100)
    end
  end

  def check_date
    errors.add(:seats, message: "date should be upcoming") if self.date <= Date.today
  end
end
