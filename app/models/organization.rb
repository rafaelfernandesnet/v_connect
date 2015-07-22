class Organization < ActiveRecord::Base

	has_many :favourites
  has_many :posts
	has_many :students, through: :favourites

end