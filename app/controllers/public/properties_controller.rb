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
       redirect_to public_properties_path
    else
      @properties = Property.all
      render :new
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to public_property_path(@property)
    else
      render :edit
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to public_properties_path
  end


  private

  def  property_params
    params.require(:property).permit(:customer_id, :floor_plan_id, :property_type_id, :image, :location, :description, :price, :sales_status, :star)
  end

end
