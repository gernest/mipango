class PlansController < ApplicationController
  respond_to :json, :html
  before_filter :authenticate_user!

  def index
    @plans=current_user.plans
    respond_with @plans
  end

  def show
    respond_with Plan.find(params[:id])
  end

  def update
    plan=Plan.find(params[:id])
    plan.update_attributes(plan_params)
    respond_with plan
  end

  def create
    respond_with Plan.create(plan_params)
  end

  def destroy
    respond_with Plan.find(params[:id]).destroy
  end

  private
  def plan_params
    params.require(:plans).permit(:title)
  end
end
