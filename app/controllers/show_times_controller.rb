class ShowTimesController < ApplicationController
  def index
    @movie = Movie.find(params[:movie_id])
    @show_times = @movie.show_times
  end
end
