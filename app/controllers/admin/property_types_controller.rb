class Admin::PropertyTypesController < ApplicationController
  
  def index
    @property_type = PropertyType.new
    @property_types = PropertyType.all
  end

  def create
    @property_type = PropertyType.new(property_type_params)
    if @property_type.save
      redirect_to admin_property_types_path
    else
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
    else
      render :edit
    end
  end

  private
  
  def property_type_params
    params.require(:property_type).permit(:name)
  end
  
end
