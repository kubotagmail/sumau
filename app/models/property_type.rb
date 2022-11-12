class PropertyType < ApplicationRecord
  has_many :properties, dependent: :destroy
  validates :name, presence: true
  
  # もし写真を持っていなかったらunless、持ってたらその写真を表示
  def get_image(width, height)
     unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
     end
      image.variant(resize_to_limit: [width, height]).processed
  end
end
