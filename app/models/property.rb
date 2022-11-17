class Property < ApplicationRecord
  has_one_attached :image
  has_many :favorites, dependent: :destroy

  belongs_to :customer
  belongs_to :floor_plan
  belongs_to :property_type

  enum sales_status: { on_sale: 0, stop_selling: 1, with_application: 2, closed: 3 }
  # on_sale: 販売中 , stop_selling: 販売停止中, with_application: 申し込みあり, closed: 成約済み

# パターン２
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  # もし写真を持っていなかったらunless、持ってたらその写真を表示
  def get_image(width, height)
    unless image.attached?
      # binding.pry
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

  # 検索方法分岐
  # whereメソッドを使いデータベースから該当データを取得し、変数に代入する。
  # "%#{word}%" で前後で部分一致
  # LIKE?は「〜のような」≒のイメージ完全なイコールではなくあいまい
  def self.looks(search, word)
    # if word.empty?
    #   return Property.all
    # end
    if search == "property_type"
      properties = Property.where(property_type_id:PropertyType.where("name LIKE?", "%#{word}%" ).pluck(:id))
    elsif search == "location"
      properties = Property.where("location LIKE?", "%#{word}%" )
    elsif search == "floor_plan"
      properties = Property.where(floor_plan_id:FloorPlan.where("name LIKE?", "%#{word}%" ).pluck(:id))
    else
      # 空を返す場合の記述
      # properties = []
      # 全部返す場合の記述
      properties = Property.all
    end
    return properties
  end

end

