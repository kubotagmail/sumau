class Admin::FloorPlansController < ApplicationController
  before_action :authenticate_admin!
  def index
    @floor_plan = FloorPlan.new
    @floor_plans = FloorPlan.all
  end

  def create
    @floor_plan = FloorPlan.new(floor_plan_params)
    if @floor_plan.save
      flash[:notice] = "間取り名の新規登録に成功しました"
      redirect_to admin_floor_plans_path
    else
      flash[:alert] = "間取り名を入力してください"
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
      flash[:notice] = "間取り名を更新しました！"
    else
      flash[:notice] = "間取り名を入れてください"
      render :edit
    end
  end

  private
  def floor_plan_params
    params.require(:floor_plan).permit(:name)
  end

end
