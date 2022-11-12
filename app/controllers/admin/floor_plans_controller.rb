class Admin::FloorPlansController < ApplicationController

  def index
    @floor_plan = FloorPlan.new
    @floor_plans = FloorPlan.all
  end

  def create
    @floor_plan = FloorPlan.new(floor_plan_params)
    if @floor_plan.save
      redirect_to admin_floor_plans_path
    else
      @floor_plans = FloorPlan.all
      render :index
    end
  end

  def edit
    @floor_plan = FloorPlan.find(params[:id])
  end

  def update
    @floor_plan = FloorPlan.find(params[:id])
    if @floor_plan.update(floor_plan_params)
      redirect_to admin_floor_plans_path
    else
      render :edit
    end
  end

  private
  def floor_plan_params
    params.require(:floor_plan).permit(:name)
  end

end
