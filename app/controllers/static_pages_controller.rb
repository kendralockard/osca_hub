class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @announcement = current_user.announcements.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def menu
    if logged_in?
      @menu  = current_user.menus.build
      @menulist_items = current_user.menulist.paginate(page: params[:page])
    end
  end

  def save_plates
    @plates = User.all
    @plates = @plates.to_json.html_safe
  end
end
