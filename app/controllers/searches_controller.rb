class SearchesController < ApplicationController
  
  def search
    # 検索モデル→params[:range]
    # 検索方法→params[:search]
    # 検索ワード→params[:word]
    @range = params[:range]
    if @range == "Property"
      @properties = Property.looks(params[:search],params[:word])
    end
  end
end