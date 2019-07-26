class CoopsController < ApplicationController
  def join
    @user = User.find(current_user.id)
  end
end
