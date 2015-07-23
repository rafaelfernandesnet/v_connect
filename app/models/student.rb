class Student < ActiveRecord::Base

  has_secure_password
	
	has_many :favourites
	has_many :organizations, through: :favourites

end