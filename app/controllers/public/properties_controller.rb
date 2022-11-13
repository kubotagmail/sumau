class Public::PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.customer_id = current_customer.id
    #byebug
    if @property.save
      redirect_to root_path
      # redirect_to public_property_path
    else
      @properties = Property.all
      render :index
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
  end

  def destroy
  end


  private

  def  property_params
    params.require(:property).permit(:customer_id, :floor_plan_id, :property_type_id, :image, :location, :description, :price, :is_active)
  end

end
