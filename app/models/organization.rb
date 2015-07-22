class Organization < ActiveRecord::Base

	has_many :favourites, :posts
	has_many :students, through: :favourites


end