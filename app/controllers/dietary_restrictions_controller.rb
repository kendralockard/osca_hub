class DietaryRestrictionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @dietary_restrictions = current_user.dietary_restrictions.build(dietary_restrictions_params)
    set_coop_id
    if @dietary_restrictions.save
      flash[:success] = "Dietary restrictions saved"
    end
    redirect_to dietary_restrictions_path
  end

  def destroy
    @restriction = DietaryRestriction.find(params[:id])
    @restriction.destroy
    flash[:success] = "Dietary restrictions deleted"
    redirect_to dietary_restrictions_path
  end

  private

    def set_coop_id
      @dietary_restrictions.coop_id = current_user.coop_id
    end

    def dietary_restrictions_params
      params.require(:dietary_restriction).permit(:vegetarian, :vegan, :honey, :honey_severe, :nuts, :nuts_severe, :gluten, :gluten_severe, :soy, :soy_severe, :other)
    end

    def correct_user
      @dietary_restrictions = current_user.dietary_restrictions.find_by(id: params[:id])
      redirect_to dietary_restrictions_path if @dietary_restrictions.nil?
    end
end
