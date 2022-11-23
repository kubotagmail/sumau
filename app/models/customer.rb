class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :properties, dependent: :destroy
  has_many :favorites, dependent: :destroy


  validates :last_name, presence: {message: "は、1文字以上で入力して下さい。"}
  validates :first_name, presence: {message: "は、1文字以上で入力して下さい。"}
  validates :postal_code, presence: :ture, format: {with: /\A[0-9]+\z/, message: "は、半角数字で入力してください。"}


  # 退会済みのユーザーが同じアカウントでログイン出来ないようにする
  def  active_for_authentication?
    super && (is_deleted == false)
  end

  # ゲストログイン用に作成した
  def self.guest
    find_or_create_by!(last_name: 'guest',first_name: 'user' ,email: 'guest@example.com') do |customer|
      # find_or_create_by!で上記のデータがあるか、存在しない場合は下記を作成
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name = "guest"
      customer.first_name = "user"
      customer.last_name_kana = "ゲスト"
      customer.first_name_kana = "ユーザー"
      customer.postal_code = "0010001"
      customer.address = "guestuser.address1234567890"
      customer.telephone_number = "0000000000"
      customer.is_deleted = false
    end
  end

end
