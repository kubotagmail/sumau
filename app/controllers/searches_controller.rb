class SearchesController < ApplicationController

  def search
    # 検索方法→params[:search]
    # 検索ワード→params[:word]
    @properties = Property.looks(params[:search],params[:word]).page(params[:page])
    # if params[:search] == "property_type"
    #   @properties = Property.where(property_type_id:PropertyType.where("name LIKE?", "%#{params[:word]}%" ).pluck(:id))
    # end

  end

end