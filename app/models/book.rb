class Book < ActiveRecord::Base
	has_one :ad, as: :category
end
