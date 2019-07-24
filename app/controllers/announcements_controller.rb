class AnnouncementsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @announcement = current_user.announcements.build(announcement_params)
    if @announcement.save
      flash[:success] = "Announcement created!"
      redirect_to root_url
    else
      @announcements = []
      redirect_to root_url
    end
  end

  def destroy
    @announcement.destroy
    flash[:success] = "Announcement deleted"
    redirect_to request.referrer || root_url
  end

  private

    def announcement_params
      params.require(:announcement).permit(:content)
    end

    def correct_user
      @announcement = current_user.announcements.find_by(id: params[:id])
      redirect_to root_url if @announcement.nil?
    end
end
