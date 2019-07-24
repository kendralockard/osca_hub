class CoopsController < ApplicationController
  def new
    @coop = Coop.new
  end

  def join
    @user = User.find(current_user.id)
    @user.update_attributes(coop_id: :coop_id)
  end
end
