class CoopsController < ApplicationController
  def new
    @coop = Coop.new
  end

  def join
    coops = { "Brown Bag" => 1, "Fairchild" => 2, "Harkness" => 3, "Keep" => 4, "Pyle" => 5, "Tank" => 6, "TWC" => 7}
    @user = User.find(current_user.id)
    @user.update_attributes(coop_id: coops[:coop])
  end
end
