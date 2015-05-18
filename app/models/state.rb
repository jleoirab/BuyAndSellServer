class State < ActiveRecord::Base
	belongs_to :nation
	has_many :towns
	validates :name, presence: true
end
