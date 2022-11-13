class PropertyType < ApplicationRecord
  has_many :properties, dependent: :destroy
  validates :name, presence: true
end
