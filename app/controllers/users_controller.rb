class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless true
  end

  def edit
  end

  # User updates their settings
  def update
    coop = @user.coop_id

    # If they requested a co-op switch, send a request to their MemCo
    # Else, update their settings
    if @user.update_attributes(user_params)
      user_switched?(coop) ?
        request_switch(coop) :
        flash[:success] = "Settings updated"
      redirect_to @user
    else
      render "edit"
    end
  end

  # Check if user requested a co-op switch
  def user_switched?(coop)
    @user.coop_id != coop
  end

  # Send co-op switch request to MemCo
  def request_switch(coop)
    @requested = @user.coop_id             # Grab co-op user requested to join
    @user.update_attributes(coop_id: coop) # Put user back in their original co-op

    UserMailer.request_switch(@user, @requested).deliver_now
    flash[:success] = "Your request to join #{Coop.find(@requested).name} \
                       has been sent to your MemCo."
  end

  # Approve user into their requested co-op
  def approve_user
    user = User.find(params[:id])
    user.update_attributes(coop_id: params[:coop_id])
    flash[:success] = "#{user.name} has been admitted to \
                      #{Coop.find(user.coop_id).name}. Thanks MemCo!"

    redirect_to root_url
    notify_user_approval(user, params[:coop_id])
  end

  # Send user email notification that they have been approved into their co-op
  def notify_user_approval(user, coop_id)
    UserMailer.notify_user_approval(user, user.coop_id).deliver_now
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :avatar, :email, :password,
                                   :password_confirmation, :coop_id, :theme)
    end

    # Confirms the correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
