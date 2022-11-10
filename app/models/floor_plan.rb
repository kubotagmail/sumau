class FloorPlan < ApplicationRecord
  has_many :properties, dependent: :destroy
end
