class Town < ActiveRecord::Base
	belongs_to :state
	has_many :ads
	validates :name, presence: true
end
