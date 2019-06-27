class MenusController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @menu = current_user.menus.build(menu_params)
    if @menu.save
      flash[:success] = "Delicious menu posted"
      redirect_to menu_path
    else
      @menulist_items = []
      render 'static_pages/menu'
    end
  end

  def destroy
    @menu.destroy
    flash[:success] = "Menu deleted"
    redirect_to request.referrer || root_url
  end

  private

    def menu_params
      params.require(:menu).permit(:content)
    end

    def correct_user
      @menu = current_user.menus.find_by(id: params[:id])
      redirect_to root_url if @menu.nil?
    end
end
