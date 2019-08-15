class AnnouncementsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @announcement = current_user.announcements.build(announcement_params)
    set_coop_id
    if @announcement.save
      update_last_comment_at
      flash[:success] = "Announcement posted!"
    end
    redirect_to root_url
  end

  def destroy
    @announcement.destroy
    flash[:success] = "Announcement deleted"
    redirect_to request.referrer || root_url
  end

  def push_announcement
    @announcement = Announcement.find(params[:id])
    @user = @announcement.user
    UserMailer.push_announcement(@user, @announcement.content).deliver_now
    flash[:success] = "Your announcement has been pushed to \
                      #{Coop.find(@user.coop_id).name}."
    redirect_to root_url
  end

  private

    def set_coop_id
      @announcement.coop_id = current_user.coop_id
    end

    def announcement_params
      params.require(:announcement).permit(:content, :attachment)
    end

    def correct_user
      @announcement = current_user.announcements.find_by(id: params[:id])
      redirect_to root_url if @announcement.nil?
    end

    def update_last_comment_at
      @announcement.last_comment_at = @announcement.created_at
      @announcement.save
    end
end
