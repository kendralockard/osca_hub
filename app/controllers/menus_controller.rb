class MenusController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @menu = current_user.menus.build(menu_params)
    set_coop_id
    if @menu.save
      flash[:success] = "Delicious menu posted!"
    end
    redirect_to menus_path
  end

  def destroy
    @menu.destroy
    flash[:success] = "Menu deleted"
    redirect_to request.referrer || menus_path
  end

  private

    def set_coop_id
      @menu.coop_id = current_user.coop_id
    end

    def menu_params
      params.require(:menu).permit(:starch, :protein, :vegetable, :restrictions, :notes, :meal)
    end

    def correct_user
      @menu = current_user.menus.find_by(id: params[:id])
      redirect_to menus_path if @menu.nil?
    end
end
