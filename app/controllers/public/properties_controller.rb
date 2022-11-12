class Public::PropertiesController < ApplicationController

  def index
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to public_property_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def  property_params
    params.require(:property).permit(:floor_plan_id, :property_type_id, :image, :location, :description, :price, :is_active)
  end

end
