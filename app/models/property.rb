class Property < ApplicationRecord
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  
  belongs_to :customer
  belongs_to :floor_plan
  belongs_to :property_type
  
end

