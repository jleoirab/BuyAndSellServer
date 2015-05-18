class Book < ActiveRecord::Base
	has_many :ads, as: :category
end
