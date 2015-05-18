class Ad < ActiveRecord::Base
  belongs_to :town
  belongs_to :category, polymorphic: true
end
