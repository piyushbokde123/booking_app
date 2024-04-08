class Movie < ApplicationRecord
	has_many :show_times, dependent: :destroy
	has_many :bookings, dependent: :destroy
	validates :name, :genre, presence: true
	has_one_attached :image 
	accepts_nested_attributes_for :show_times
end
