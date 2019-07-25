class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @announcement = current_user.announcements.build
      @announcements = current_user.announcement_feed.paginate(page: params[:page])
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
      @menus = current_user.menu_feed.paginate(page: params[:page])
    end
  end

  def save_plates
  end

  def workchart
  end

  def sub_requests
    if logged_in?
      @events = current_user.events_feed
      @users_name_by_id = User.all.collect.to_h { |user| [user.id, user.name] }
      @users_email_by_id = User.all.collect.to_h { |user| [user.id, user.email] }
      @user = current_user
    end
  end
end
