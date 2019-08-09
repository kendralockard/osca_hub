class Comment < ApplicationRecord
  belongs_to :announcement
  belongs_to :user

  after_save :update_announcement_last_comment_at

  private

  def update_announcement_last_comment_at
    @announcement = Announcement.find(announcement_id)
    @announcement.last_comment_at = created_at
    @announcement.save
  end
end
