class SearchesController < ApplicationController
  before_action :authenticate_customer!
  
  def search
    
    # 検索方法→params[:search]
    # 検索ワード→params[:word]
    
    # ↓全てのユーザーが登録した物件情報が表示される
    # @properties = Property.looks(params[:search],params[:word]).page(params[:page])
    
    # ↓現在ログイン中のユーザーが登録した物件情報のみを表示
    @properties = Property.where(customer_id:current_customer).looks(params[:search],params[:word]).page(params[:page])
    # if params[:search] == "property_type"
    #   @properties = Property.where(property_type_id:PropertyType.where("name LIKE?", "%#{params[:word]}%" ).pluck(:id))
    # end

  end

end