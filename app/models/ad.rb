class Ad < ActiveRecord::Base
  belongs_to :town
  belongs_to :category, polymorphic: true

  validates :creator_email, presence: true
  validates :town_id, presence: true
  validates :description, length: {maximum: 400}
end
