class Student < ActiveRecord::Base
	
	has_many :favourites
	has_many :organizations, through: :favourites

  validates :email, uniqueness: true

end

