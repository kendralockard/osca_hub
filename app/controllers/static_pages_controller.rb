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
      @vegetarian = DietaryRestriction.where(vegetarian: true, coop_id: current_user.coop_id)
      @vegan = DietaryRestriction.where(vegan: true, coop_id: current_user.coop_id)
      @no_honey = DietaryRestriction.where(honey: true, coop_id: current_user.coop_id)
      @no_nuts = DietaryRestriction.where(nuts: true, coop_id: current_user.coop_id)
      @no_gluten = DietaryRestriction.where(gluten: true, coop_id: current_user.coop_id)
      @no_soy = DietaryRestriction.where(soy: true, coop_id: current_user.coop_id)
      @other = DietaryRestriction.where(coop_id: current_user.coop_id).map { |r| r.other }
    end
  end

end
