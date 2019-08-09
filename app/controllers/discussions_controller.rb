class DiscussionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @discussion = current_user.discussions.build(event_params)
    @discussion.coop_id = current_user.coop_id
    if @discussion.save
      flash[:success] = "Discussion posted!"
    end
    redirect_to discussions_path
  end

  def destroy
    @discussion = Discussion.find(params[:discussion_id])
    @discussion.destroy
    flash[:success] = "Discussion deleted"
    redirect_to discussions_path
  end

  private

    def event_params
      params.require(:discussion).permit(:date, :meal, :title, :message)
    end

    def correct_user
      @discussion = current_user.discussions.find_by(id: params[:id])
      redirect_to discussions_path if @discussion.nil?
    end
end
