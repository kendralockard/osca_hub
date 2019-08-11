class CommentsController < ApplicationController
  before_action :find_announcement
  before_action :find_comment, only: [:destroy]

  require 'rails_autolink'

  def create
    @comment = @announcement.comments.create(params[:comment].permit(:content))
    set_user_id
    update_announcement_last_comment_at

    if @comment.save
      flash[:success] = "Comment posted!"
    end
    redirect_to root_url
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to root_url
  end

  private

    def set_user_id
      @comment.user_id = current_user.id
    end

    def update_announcement_last_comment_at
      @comment.announcement.last_comment_at = @comment.created_at
    end

    def find_announcement
      @announcement = Announcement.find(params[:announcement_id])
    end

    def find_comment
      @comment = @announcement.comments.find(params[:id])
    end
end
