class CoopsController < ApplicationController
  def new
    @coop = Coop.new
  end

  def join
    coops = { "Brown Bag" => 1, "Fairchild" => 2, "Harkness" => 3, "Keep" => 4, "Pyle" => 5, "Tank" => 6, "TWC" => 7}
    @user = User.find(current_user.id)
    @user.update_attributes(coop_id: coops[:coop])
    if @user.save
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'join'
    end
  #  @coop = Coop.find(params[:id])
  #   @m = @group.memberships.build(:user_id => current_user.id)
  #   respond_to do |format|
  #     if @m.save
  #       format.html { redirect_to(@group, :notice => 'You have joined this group.') }
  #       format.xml  { head :ok }
  #     else
  #       format.html { redirect_to(@group, :notice => 'Join error.') }
  #       format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
  #     end
  #   end
   end
end
