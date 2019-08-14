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
      @users_by_name = User.all.map { |user| [user.id, user.name] }.to_h
      @users_by_email = User.all.map { |user| [user.id, user.email] }.to_h
      @user = current_user
    end
  end

  def hand_signs
  end

  def discussions
    if logged_in?
      @discussions = current_user.discussions_feed
      @users_by_name = User.all.map { |user| [user.id, user.name] }.to_h
      @users_by_email = User.all.map { |user| [user.id, user.email] }.to_h
      @user = current_user
    end
  end

  def dietary_restrictions
    if logged_in?
      @dietary_restrictions = current_user.dietary_restrictions.build
      @dietary_restrictions = current_user.dietary_restrictions.paginate(page: params[:page])
    end
  end

end
