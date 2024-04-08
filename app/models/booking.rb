class Booking < ApplicationRecord
  belongs_to :show_time
  belongs_to :user
  belongs_to :movie
  validates :detail, presence: true
  after_update :change_seat_status
  after_destroy :make_available_cancel_seats

  private

  def change_seat_status
    show_time = ShowTime.find(show_time_id)
    show_time.seats.where(seat_number: self.seat_number).update(available: false)
  end

  def make_available_cancel_seats
    show_time = ShowTime.find(show_time_id)
    show_time.seats.where(seat_number: self.seat_number).update(available: true)
  end
end
