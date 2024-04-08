class BookingsController < ApplicationController
  before_action :set_show_time, only: [:new, :create]
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = current_user.present? && current_user.role == 'user' ? current_user.bookings : Booking.all
  end

  def new
    @selected_seats = params[:selected_seats]
    @booking = @show_time.bookings.new
  end

  def create
    if @show_time.available_seats.positive?
      @booking = @show_time.bookings.create(bookings_params)
      @booking.update(seat_number: params[:booking][:seat_number].split)
      redirect_to show_time_booking_path(@show_time, @booking), notice: "Booking confirmed successfully."
    else
      redirect_to showtime_path(@show_time), alert: "No available seats."
    end
  end

  def show
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, notice: "Booking cancelled successfully."
  end

  private

  def set_show_time
    @show_time = ShowTime.find(params[:show_time_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def bookings_params
    params.require(:booking).permit(:detail, :show_timing, :total_seats, :price, :user_id, :movie_id, seat_number: [])
  end
end
