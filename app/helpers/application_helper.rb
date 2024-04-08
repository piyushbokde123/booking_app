module ApplicationHelper

	def price_count(selected_seats, price)
    selected_seats.count * price
	end

	def movie_name(movie)
    movie_name = Movie.find(movie)
    movie_name.name
	end
end
