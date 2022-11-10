class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :property
  
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
  
end
