class CommentsController < ApplicationController
  before_action :find_announcement
  before_action :find_comment, only: [:destroy]

  require 'rails_autolink'

  def create
    @comment = @announcement.comments.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.announcement.last_comment_at = @comment.created_at

    if @comment.save
      flash[:success] = "Comment posted!"
      redirect_to root_url
    else
      flash[:danger] = "Comment failed"
      redirect_to root_url
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to root_url
  end

  private

    def find_announcement
      @announcement = Announcement.find(params[:announcement_id])
    end

    def find_comment
      @comment = @announcement.comments.find(params[:id])
    end
end
