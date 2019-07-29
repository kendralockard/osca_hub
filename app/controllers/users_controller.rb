class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @announcements = @user.announcements.paginate(page: params[:page])
    redirect_to root_url and return unless true
  end

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

  def edit
  end

  def update
    prev_coop = @user.coop_id
    if @user.update_attributes(user_params)
      switched_coop?(prev_coop) ?
        request_switch(prev_coop) :
        flash[:success] = "Settings updated"
      redirect_to @user
    else
      render "edit"
    end
  end

  def coops
    ["", "Brown Bag", "Fairkid", "Harkness", "Keep", "Pyle", "Tank", "TWC"]
  end

  def switched_coop?(prev_coop)
    @user.coop_id != prev_coop
  end

  def request_switch(prev_coop)
    @requested_coop = @user.coop_id
    @user.update_attributes(coop_id: prev_coop)
    UserMailer.request_switch(@requested_coop, @user).deliver_now
    flash[:success] = "Your request to join " + coops()[@requested_coop] + \
                       " has been sent to your MemCo."
  end

  def approve_user
    user = User.find(params[:id])
    user.update_attributes(coop_id: params[:coop_id])
    flash[:success] = user.name + " has been admitted to " + \
                      coops()[user.coop_id] + ". Thanks MemCo!"
    notify_user_of_approval(user, coop_id: params[:coop_id])
    redirect_to root_url
  end

  def notify_user_of_approval(user, coop_id: coop_id)
    @user = user
    @coop_id = coop_id
    UserMailer.notify_user_of_approval(@user, @coop_id)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :coop_id)
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
