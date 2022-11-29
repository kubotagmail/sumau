class Admin::PropertyTypesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @property_type = PropertyType.new
    @property_types = PropertyType.all
  end

  def create
    @property_type = PropertyType.new(property_type_params)
    if @property_type.save
      flash[:notice] = "物件種別名の新規登録に成功しました"
      redirect_to admin_property_types_path
    else
      flash[:notice] = "物件種別名を入力してください"
      @property_types = PropertyType.all
      render :index
    end
  end

  def edit
    @property_type = PropertyType.find(params[:id])
  end

  def update
    @property_type = PropertyType.find(params[:id])
    if @property_type.update(property_type_params)
      redirect_to admin_property_types_path
      flash[:notice] = "物件種別名を更新しました！"
    else
      flash[:notice] = "物件種別名を入れてください"
      render :edit
    end
  end

  private

  def property_type_params
    params.require(:property_type).permit(:name)
  end

end
