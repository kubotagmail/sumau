class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = current_customer
    # Favoriteモデルから、property_idを取得する。
    properties = Favorite.where(customer_id: @customer.id).pluck(:property_id)
    @favorite_properties = Property.where(id: properties).page(params[:page])
    # byebug

    # whereメソッド・・・与えられた条件にマッチするレコードを全て取得します。
    # pluck・・・カラムを取得
    # 例えば、モデル名.pluck(:カラム名)という記述があった場合、
    # モデルからカラムの一覧を持ってこれる。
    # 1つのモデルで使用されているテーブルからカラム (1つでも複数でも可) を取得することができるそう。

  end

  def create
    @property = Property.find(params[:property_id])
    favorite = current_customer.favorites.new(property_id: @property.id)
    favorite.save
    # 非同期化のためredirect先を削除
    # redirect_to request.referer
  end

  def destroy
    @property = Property.find(params[:property_id])
    favorite = current_customer.favorites.find_by(property_id: @property.id)
    favorite.destroy
    # 非同期化のためredirect先を削除
    # redirect_to request.referer
  end

end
