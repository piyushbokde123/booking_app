class SeatsController < ApplicationController
  
  def index
    show_time = ShowTime.find(params[:show_time_id])
    @seat = show_time.seats
  end
end
