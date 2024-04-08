class MoviesController < ApplicationController

	def index
    @movies = if params[:search]
                Movie.where("name LIKE ?", "%#{params[:search]}%")
              else
                Movie.all
              end
	end

	def new
    @movie = Movie.new
    @movie.show_times.build
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to root_path, notice: 'New Movie Added Successfully.'
    else
      render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    if @movie.destroy
     	redirect_to root_path, notice: "#{@movie.name} Movie deleted Successfully."
    else
      redirect_to root_path, notice: "#{@movie.name} Movie is not deleted."
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :genre, :image, show_times_attributes: [:id, :start_time, :date, :seat_count, :_destroy])
  end
end
